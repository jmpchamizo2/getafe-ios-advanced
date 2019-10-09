//
//  DataManager.swift
//  CursoIOSAdvaced
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 on. All rights reserved.
//

import Foundation

//Singleton
class DataManager {
    // MARK: - Singleton declaration
    static let shared = DataManager()
    private init(){}
    
    
    func users(completion: @escaping ServiceCompletion){
        DispatchQueue.global(qos: .background).async { [weak self] in
            if let usersDAO = self?.usersDB(), usersDAO.count > 0 {
                //devolver userDB
                let usersView = self?.usersDAOToUsersView(usersDAO)
                DispatchQueue.main.async {
                    completion(.success(data: usersView))
                }
            } else {
                //llamar al servicio y guardar usuarios en bbdd
                DispatchQueue.main.async {
                    self?.usersForceUpadate(completion: completion)
                }
            }
        }
    }
    
    private func usersDAOToUsersView(_ usersDAO: Array<UserDAO>) -> Array<UserView>{
        return usersDAO.compactMap { userDAO in
            return self.userDaoToUserView(userDAO)
        }
    }
    
    private func usersDTOToUsersView(_ usersDTO: Array<UserDTO>) -> Array<UserView>{
        return usersDTO.compactMap { userDTO in
            return self.userDTOToUserView(userDTO)
        }
    }
    
    func usersForceUpadate(completion: @escaping ServiceCompletion){
        //llamar al servicio para obtener nuevos usuarios
        DispatchQueue.global(qos: .background).async {
            ApiManager.shared.fetchUsers (){ [weak self] result in
                switch result {
                case .success(let data):
                    guard let users = data as? UsersDTO else {
                        DispatchQueue.main.async {
                            completion(.failure(msg: "Mensaje error generíco"))
                        }
                        return
                    }
                    //Eliminiar todos los usuarios de la base de datos
                    DatabaseManager.shared.deleteAll()
                    //Guardar ususairo en la base de datos
                    self?.save(users: users)
                    guard let usersDTO = users.users else {
                        completion(.failure(msg: "No podemos tenemos UsersDTO"))
                        return
                    }
                    let usersView = self?.usersDTOToUsersView(usersDTO)
                    DispatchQueue.main.async {
                        completion(.success(data: usersView))
                    }
                case .failure(let msg):
                    print("Fallo al obtener usuarios del servicio: \(msg)")
                    DispatchQueue.main.async {
                        completion(.failure(msg: msg))
                    }
                }
            }
        }
    }
    
    func user(by id: String, completion: @escaping ServiceCompletion) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let userDAO = DatabaseManager.shared.user(by: id) else {
                DispatchQueue.main.async {
                    completion(.failure(msg: "No existe usuario"))
                }
                return
            }
            let userView = self?.userDaoToUserView(userDAO)
            DispatchQueue.main.async {
                completion(.success(data: userView))
            }
        }
    }
    
    
    private func userDaoToUserView(_ userDAO: UserDAO) -> UserView {
        return  UserView(id: userDAO.uuid,
                         avatar: userDAO.avatar,
                         firstName: userDAO.firstName,
                         lastName: userDAO.lastName,
                         email: userDAO.email,
                         country: userDAO.country,
                         birthdate: userDAO.birthdate,
                         nationality: userDAO.nationality)
    }
    
    private func userDTOToUserView(_ userDTO: UserDTO) -> UserView {
        return  UserView(id: userDTO.login?.uuid,
                         avatar: userDTO.picture?.large,
                         firstName: userDTO.name?.first,
                         lastName: userDTO.name?.last,
                         email: userDTO.email,
                         country: userDTO.location?.country,
                         birthdate: userDTO.dob?.date,
                         nationality: userDTO.nat)
    }
    
    
    
    private func usersDB() -> Array<UserDAO> {
        return Array(DatabaseManager.shared.users())
    }
    
    private func save(users: UsersDTO) {
        guard let usersToSave = users.users else {
            return
        }
        usersToSave.forEach{ save(user: $0) }
    }
    
    private func save(user: UserDTO) {
        guard let userId = user.login?.uuid else{
            return
        }
        
        let userDB = UserDAO(uuid: userId,
                             avatar: user.picture?.large,
                             firstName: user.name?.first,
                             lastName: user.name?.last,
                             email: user.email,
                             gender: user.gender,
                             birthdate: user.dob?.date,
                             country: user.location?.country,
                             latitude: user.location?.coordinates?.latitude?.description,
                             longitude: user.location?.coordinates?.longitude?.description)
        DatabaseManager.shared.save(user: userDB)
    }
    
    
    
}


//
//  ApiManager.swift
//  CursoIOSAdvaced
//
//  Created by Dev2 on 07/10/2019.
//  Copyright © 2019 on. All rights reserved.
//

import Foundation


enum ServiceResult {
    //Aqui en caso de exito a la llamada del servicio devolveremos aquello que nos devuelva el servicio.
    case success(data: Any?)
    case failure(msg: String)
}

typealias ServiceCompletion = (_ results: ServiceResult) -> ()


class ApiManager {
    // MARK: - Singleton declaration
    static let shared = ApiManager()
    private init(){}
    
    
    // MARK: - Properties
    private let numUsers: Int = 100
    
    func fetchUsers(completion: ServiceCompletion) {
        //Llamar al servicio
        do {
            guard let url = Bundle.main.url(forResource: "users", withExtension: "json") else {
                return
            }
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat =  "yyyy-MM-dd'T'HH:mm:ssZ"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            let data = try Data(contentsOf: url)
            let usersDTO = try decoder.decode(UsersDTO.self, from: data)
            usersDTO.users?.forEach { user in
                debugPrint(user.name ?? "No encuentra nombre")
            }
            completion(.success(data: usersDTO.users))
        }
        catch {
            print(error)
        }
        //Devolver datos
  
    }
    

}
    



        

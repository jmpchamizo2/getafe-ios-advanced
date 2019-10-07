//
//  DatabaseManager.swift
//  CursoIOSAdvaced
//
//  Created by Dev2 on 07/10/2019.
//  Copyright © 2019 on. All rights reserved.
//

import Foundation
import RealmSwift

class DatabaseManager {
    // MARK: - Singleton declaration
    static let shared = DatabaseManager()
    private init(){}
    
    // MARK: - Properties
    //Get the default Realm database
    private let realm = try! Realm()
    
    
    func save(user: UserDAO){
        try! realm.write {
            realm.add(user,
                      update: .modified)
        }
    }
    
    func users() -> Results<UserDAO> {
        return realm.objects(UserDAO.self)
    }
    
    func user(id: String) -> UserDAO? {
        return realm.object(ofType: UserDAO.self, forPrimaryKey: id)
    }
    
    func deleteAll(){
        realm.deleteAll()
    }
    
    func delete(id: String) {
        guard let userToDelete = user(id: id) else {
            return
        }
        try! realm.write {
            realm.delete(userToDelete)
        }

    }
    
    func delete(user: UserDAO){
        try! realm.write {
            realm.delete(user)
        }
    }
}



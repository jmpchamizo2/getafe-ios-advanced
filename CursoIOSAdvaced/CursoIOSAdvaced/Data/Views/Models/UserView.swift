//
//  UserView.swift
//  CursoIOSAdvaced
//
//  Created by Dev2 on 08/10/2019.
//  Copyright © 2019 on. All rights reserved.
//

import Foundation

class UserView {
    let id: String?
    let avatar: String?
    let firstName: String?
    let lastName: String?
    let email: String?
    let country: String?
    let birthdate: Date?
    let nationality: String?
    
    var name: String{
        return "\(String(describing: firstName)) \(String(describing:lastName))"
    }
    
    var age: Int{
        guard let mBirthdate = self.birthdate,
            let mAge = Calendar.current.dateComponents([.year], from: mBirthdate, to: Date()).year else {
            return -1
        }
        return mAge
        
    }
    
    
    
    init(id: String?,
         avatar: String? = nil,
         firstName: String? = nil ,
         lastName: String? = nil ,
         email: String? = nil,
         country: String? = nil,
         birthdate: Date? = nil,
         nationality: String? = nil) {
        
        self.id = id
        self.avatar = avatar
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.country = country
        self.birthdate = birthdate
        self.nationality = nationality
        
        
    }
}

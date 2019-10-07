//
//  UsersDTO.swift
//  CursoIOSAdvaced
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 on. All rights reserved.
//

import Foundation

//Codable: objeto a JSON - JSON a objeto.
struct UsersDTO: Codable {
    
    let users: Array<UserDTO>?
    let info: InfoDTO?
    
    //Eliminamos las dependencias del serivicio en nuestro modelo. Nosotros lo llamamos users pero el serivicio lo llama results pedimos que cuando llegue results lo transforme a users
    private enum CodingKeys: String, CodingKey {
        case users = "results"
        case info
    }
}

//
//  UserDTO.swift
//  CursoIOSAdvaced
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 on. All rights reserved.
//

import Foundation


struct UserDTO: Codable {
    
    let gender: String?
    let name: NameDTO?
    let location: LocationDTO?
    let email: String?
    let login: LoginDTO?
    let dob: DobDTO?
    let registered: RegisteredDTO?
    let phone: String?
    let cell: String?
    //let id: UserIdDTO?
    let picture: PictureDTO?
    let nat: String?
    
}

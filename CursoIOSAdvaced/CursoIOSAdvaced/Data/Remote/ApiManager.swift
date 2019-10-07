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
        
        //Devolver datos
        completion(.success(data: "Bieeeeenn"))
        
    }
    
    
}

//
//  InfoDTO.swift
//  CursoIOSAdvaced
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 on. All rights reserved.
//

import Foundation

struct InfoDTO: Codable {
   let seed: String?
   let count: Int?
   let page: Int?
   let version: String?
    
    
    
    private enum CodingKeys: String, CodingKey {
        case seed
        case page
        case version
        case count = "results"
    }
}

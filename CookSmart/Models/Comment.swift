//
//  Comment.swift
//  CookSmart
//
//  Created by Piotr Obara on 01/05/2022.
//

import Foundation

struct Comment: Codable {
    
    var id: Int?
    var body: String?
    var created_at: String?
    var updated_at: String?
}

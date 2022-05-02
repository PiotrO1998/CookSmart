//
//  Ingredient.swift
//  CookSmart
//
//  Created by Piotr Obara on 01/05/2022.
//

import Foundation

struct Ingredient: Codable {
    
    var id: Int?
    var name: String?
    var amount: Float?
    var metric: String?
    var is_important: Int?
}

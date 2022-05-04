//
//  Ingredient.swift
//  CookSmart
//
//

import Foundation

struct Ingredient: Codable {
    
    var id: Int?
    var name: String?
    var amount: Float?
    var metric: String?
    var is_important: Int?
}

//
//  Recipe.swift
//  CookSmart
//
//  Created by Piotr Obara on 01/05/2022.
//

import Foundation
import Alamofire

struct Recipe: Codable {
    
    var id: Int?
    var name: String?
    var description: String?
    var cook_time: Int?
    var level: String?
    var number_of_servings: Int?
    var image: String?
    var image_url: String?
    var user: User?
    var ingredients: [Ingredient]?
    var instructions: [Instruction]?
    var comments: [Comment]?
    var tags: [Tag]?
    var likes: [Like]?
    var created_at: String?
    var updated_at: String?
}

//
//  MealPlan.swift
//  CookSmart
//
//  Created by Piotr Obara on 01/05/2022.
//

import Foundation

struct MealPlan: Codable {
    
    var id: Int?
    var name: String?
    var description: String?
    var user: User?
    var recipes: Recipe?
    var comments: [Comment]?
    var tags: [Tag]?
    var likes: [Like]?
    var created_at: String?
    var updated_at: String?
}


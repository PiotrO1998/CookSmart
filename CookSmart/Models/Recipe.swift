//
//  Recipe.swift
//  CookSmart
//
//  Created by Piotr Obara on 14/04/2021.
//

import Foundation
import UIKit

struct Recipe {
    var name: String
    var image: UIImage
    var cookTime: String
    var level: String
    var Servings: Int //For how many people
    var ingredietnsImportant: [Ingredient]
    var ingredietns: [Ingredient]
    var cookingInstruction: String
    var source: String 
    }

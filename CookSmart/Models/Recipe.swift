//
//  Recipe.swift
//  CookSmart
//
//  Created by Piotr Obara on 14/04/2021.
//

import UIKit

struct Recipe {
    let name: String
    let image: UIImage
    let cookTime: String
    let level: String
    let Servings: Int //For how many people
    let ingredietnsImportant: [Ingredient]
    let ingredietns: [Ingredient]
    let cookingInstruction: String
    let source: String
    let type: String
    }

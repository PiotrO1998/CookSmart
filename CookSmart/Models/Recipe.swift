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
    var image: UIImageView
    var cookTime: Int
    var level: String
    var Servers: Int //For how many people
    var ingredietns: [Ingredient]
    var cookingInstruction: String
    }



import Foundation

/// struct represent Ingredient object
///
///  - Author: Piotr Obara
///  - Version: 1.4
///
struct Ingredient: Equatable {
    var amount: Float
    var metric: String?
    var nameOfIngredient: String
    
    
    /// function return ingredient as a String
    ///
    /// - Returns:
    func getIngredientString() -> String {
        var metric1 = ""
        
        if let m = metric {
             metric1 = m
        }
        
        let ingredientString = String(amount) + " " + String(metric1) + " " + nameOfIngredient 
        return ingredientString
    }
    
    
    /// function multiply amount by value
    ///
    /// - Parameter value: multiply amount
    mutating func multiplyAmount(value: Float) {
        amount = amount * value
    }
    
    /// function add value to amount
    ///
    /// - Parameter value: add to amount
    mutating func addAmount(value: Float) {
        amount = amount + value
    }
    
}



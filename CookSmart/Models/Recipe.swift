
import UIKit

/// struct represent Recipe object
///
///  - Author: Piotr Obara
///  - Version: 1.3
///
struct Recipe {
    var name: String
    var image: UIImage
    var cookTime: Int
    var level: String
    var servings: Int //For how many people
    var ingredietnsImportant: [Ingredient]
    var ingredietns: [Ingredient]
    var cookingInstruction: String
    var source: String?
    var type: String?
    
    
    /// Function return all ingredient stored in recipe as String
    ///
    /// - Returns: String of all ingredients in recipe
   func getIngredients() -> String {
        var ingredientsString: String = ""
    
        for ingredient in ingredietns {
            ingredientsString += ingredient.getIngredientString() + "\n"
            }
        for ingredient in ingredietnsImportant {
            ingredientsString += ingredient.getIngredientString() + "\n"
            }
    
        return ingredientsString
        }
    
    ///
    ///  Function return all ingredients stored in recipe as array of String
    ///
    ///  - Returns: array of String as all ingredients
    func getIngredientsArray() -> [String] {
        var ingredientsArray: [String] = []
        
        for ingredientImportant in ingredietnsImportant {
            ingredientsArray.append(ingredientImportant.nameOfIngredient)
        }

        for ingredient in ingredietns {
            ingredientsArray.append(ingredient.nameOfIngredient)
        }

        return ingredientsArray
    }
    
    ///
    /// Function return importants ingredients stored in recipe as array od String
    ///
    /// - Returns: array of String as important ingredients
    func getIngredientsImportantArray() -> [String] {
        var ingredientsArray: [String] = []
        
        for ingredientImportant in ingredietnsImportant {
            ingredientsArray.append(ingredientImportant.nameOfIngredient)
        }
        return ingredientsArray
    }
    
    ///
    ///  Function mulitply all ingredients stored in recipe by value
    ///
    /// - Parameter value: value that multiple all ingredients
    mutating func multipleIngredients(value: Float) {
        for var ingredient in ingredietnsImportant {
            ingredient.multiplyAmount(value: value)
        }
        
        for var ingredient in ingredietns {
            ingredient.multiplyAmount(value: value)
        }
    }
    
}



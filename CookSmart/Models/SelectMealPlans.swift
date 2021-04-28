

import Foundation

/// struct represent SelectMealPlan object
/// Main alghortim
///
///  - Author: Piotr Obara
///  - Version: 1.7
struct SelectMealPlans {
    
    var recipes: [Recipe]
    var ingredietns: [String]
    
    
    /// function returns up to 5 best evaluated meal plans
    ///
    /// - Returns: evaluated meal plans as recipe array
    func getMealPlans() -> [[Recipe]] {
        let evaluatedValidSetsOfRecipes: [SetEvalaute] = evaluateSetOfValidRecipes()
        let validRecipes = getEvaluatedValidRecipes()
        var mealPlans: [[Recipe]] = []
        
        for evaluatedSet in evaluatedValidSetsOfRecipes {
            mealPlans.append([validRecipes[evaluatedSet.set.0].recipe,validRecipes[evaluatedSet.set.1].recipe,validRecipes[evaluatedSet.set.2].recipe])
        }
        return mealPlans
    }
    
    
    /// function return evaluated recipes based on how many ingredients they contains from selected ingredients
    ///
    /// - Returns: array of RecipeEvaluate objects
    func getEvaluatedValidRecipes() -> [RecipeEvaluate] {
        let validRecipes = getValidRecipes()
        var evaluatedRecipes: [RecipeEvaluate] = []
        
        for recipe in validRecipes {
            var evaluation = 0
            for ingredient in ingredietns {
                if recipe.getIngredientsImportantArray().contains(ingredient) {
                    evaluation += 1
                }
            }
            let recipeEvaluated: RecipeEvaluate = RecipeEvaluate(recipe: recipe, evaluation: evaluation)
            evaluatedRecipes.append(recipeEvaluated)
        }
        evaluatedRecipes.sort { $0.evaluation > $1.evaluation } //sort recipes by number of ingredients (by descending order)
        
        return evaluatedRecipes
    }
    
    /// function check which recipes contains chosen ingredients by user
    ///
    /// - Returns: array of Recipe objects
    func getValidRecipes() -> [Recipe] {
        var validRecipes: [Recipe] = []
        
        for recipe in recipes {
            for ingredient in ingredietns {
                if recipe.getIngredientsImportantArray().contains(ingredient) {
                    if !validRecipes.contains { $0.name == recipe.name && $0.cookingInstruction == recipe.cookingInstruction } {
                    validRecipes.append(recipe)
                    }
                }
            }
        }
        return validRecipes
    }
    
    
    
    ///function using prepreed combinations (CombinationsData) chosing best sets of recipes
    ///1 Functions takes recipes that cointains mosta ingredients from user selection
    ///2 Fuction using prepared combinations data, checing all possible combinations
    ///of 3 recipes and evaluated it based on which set contains most commons ingredients
    ///3 Functions return best sets (those that contains most common ingredients)
    ///What is worth to metion function take in to resposibility only important ingredients, the one that have short expiration tdate
    ///In case of 21 recipes function check 1330 combinations of recipes (set)
    ///
    /// - Returns: array of SetEvaluate objects
    func evaluateSetOfValidRecipes() -> [SetEvalaute] {
        
        let evaluatedRecipes = getEvaluatedValidRecipes()
        let size = evaluatedRecipes.count
        
        var evaluationsOfSets: [SetEvalaute] = []
        var evaluationsOfSetsToReturn: [SetEvalaute] = []
        
        switch size {
        case 0:
            print("nothing to return")
        case 1:
            //return recipes/set
            print("return one meal plan")
            let setEvaluate: SetEvalaute = SetEvalaute(set: (0,0,0), evaluation: 1)
            evaluationsOfSets.append(setEvaluate)
        case 2:
            let setEvaluate: SetEvalaute = SetEvalaute(set: (0,1,1), evaluation: 1)
            evaluationsOfSets.append(setEvaluate)
        case 3:
            let setEvaluate: SetEvalaute = SetEvalaute(set: (0,1,2), evaluation: 1)
            evaluationsOfSets.append(setEvaluate)
        case 4:
            for set in CombinationsData.combinations4 {
                evaluationsOfSets.append(evaluateSet(recipe1: evaluatedRecipes[set.0].recipe, recipe2: evaluatedRecipes[set.1].recipe, recipe3: evaluatedRecipes[set.2].recipe, set: set))
            }
        case 5:
            for set in CombinationsData.combinations5 {
                evaluationsOfSets.append(evaluateSet(recipe1: evaluatedRecipes[set.0].recipe, recipe2: evaluatedRecipes[set.1].recipe, recipe3: evaluatedRecipes[set.2].recipe, set: set))
            }
        case 6:
            for set in CombinationsData.combinations6 {
                evaluationsOfSets.append(evaluateSet(recipe1: evaluatedRecipes[set.0].recipe, recipe2: evaluatedRecipes[set.1].recipe, recipe3: evaluatedRecipes[set.2].recipe, set: set))
            }
        case 7:
            for set in CombinationsData.combinations7 {
                evaluationsOfSets.append(evaluateSet(recipe1: evaluatedRecipes[set.0].recipe, recipe2: evaluatedRecipes[set.1].recipe, recipe3: evaluatedRecipes[set.2].recipe, set: set))
            }
        case 8:
            for set in CombinationsData.combinations8 {
                evaluationsOfSets.append(evaluateSet(recipe1: evaluatedRecipes[set.0].recipe, recipe2: evaluatedRecipes[set.1].recipe, recipe3: evaluatedRecipes[set.2].recipe, set: set))
            }
        case 9:
            for set in CombinationsData.combinations9 {
                evaluationsOfSets.append(evaluateSet(recipe1: evaluatedRecipes[set.0].recipe, recipe2: evaluatedRecipes[set.1].recipe, recipe3: evaluatedRecipes[set.2].recipe, set: set))
            }
        case 10:
            for set in CombinationsData.combinations10 {
                evaluationsOfSets.append(evaluateSet(recipe1: evaluatedRecipes[set.0].recipe, recipe2: evaluatedRecipes[set.1].recipe, recipe3: evaluatedRecipes[set.2].recipe, set: set))
            }
        case 11:
            for set in CombinationsData.combinations11 {
                evaluationsOfSets.append(evaluateSet(recipe1: evaluatedRecipes[set.0].recipe, recipe2: evaluatedRecipes[set.1].recipe, recipe3: evaluatedRecipes[set.2].recipe, set: set))
            }
        case 12:
            for set in CombinationsData.combinations12 {
                evaluationsOfSets.append(evaluateSet(recipe1: evaluatedRecipes[set.0].recipe, recipe2: evaluatedRecipes[set.1].recipe, recipe3: evaluatedRecipes[set.2].recipe, set: set))
            }
        case 13:
            for set in CombinationsData.combinations13 {
                evaluationsOfSets.append(evaluateSet(recipe1: evaluatedRecipes[set.0].recipe, recipe2: evaluatedRecipes[set.1].recipe, recipe3: evaluatedRecipes[set.2].recipe, set: set))
            }
        case 14:
            for set in CombinationsData.combinations14 {
                evaluationsOfSets.append(evaluateSet(recipe1: evaluatedRecipes[set.0].recipe, recipe2: evaluatedRecipes[set.1].recipe, recipe3: evaluatedRecipes[set.2].recipe, set: set))
            }
        case 15:
            for set in CombinationsData.combinations15 {
                evaluationsOfSets.append(evaluateSet(recipe1: evaluatedRecipes[set.0].recipe, recipe2: evaluatedRecipes[set.1].recipe, recipe3: evaluatedRecipes[set.2].recipe, set: set))
            }
        case 16:
            for set in CombinationsData.combinations16 {
                evaluationsOfSets.append(evaluateSet(recipe1: evaluatedRecipes[set.0].recipe, recipe2: evaluatedRecipes[set.1].recipe, recipe3: evaluatedRecipes[set.2].recipe, set: set))
            }
        case 17:
            for set in CombinationsData.combinations17 {
                evaluationsOfSets.append(evaluateSet(recipe1: evaluatedRecipes[set.0].recipe, recipe2: evaluatedRecipes[set.1].recipe, recipe3: evaluatedRecipes[set.2].recipe, set: set))
            }
        case 18:
            for set in CombinationsData.combinations18 {
                evaluationsOfSets.append(evaluateSet(recipe1: evaluatedRecipes[set.0].recipe, recipe2: evaluatedRecipes[set.1].recipe, recipe3: evaluatedRecipes[set.2].recipe, set: set))
            }
        case 19:
            for set in CombinationsData.combinations19 {
                evaluationsOfSets.append(evaluateSet(recipe1: evaluatedRecipes[set.0].recipe, recipe2: evaluatedRecipes[set.1].recipe, recipe3: evaluatedRecipes[set.2].recipe, set: set))
            }
        case 20:
            for set in CombinationsData.combinations20 {
                evaluationsOfSets.append(evaluateSet(recipe1: evaluatedRecipes[set.0].recipe, recipe2: evaluatedRecipes[set.1].recipe, recipe3: evaluatedRecipes[set.2].recipe, set: set))
            }
        case 21:
            for set in CombinationsData.combinations21 {
                evaluationsOfSets.append(evaluateSet(recipe1: evaluatedRecipes[set.0].recipe, recipe2: evaluatedRecipes[set.1].recipe, recipe3: evaluatedRecipes[set.2].recipe, set: set))
            }
        default:
            for set in CombinationsData.combinations21 {
                evaluationsOfSets.append(evaluateSet(recipe1: evaluatedRecipes[set.0].recipe, recipe2: evaluatedRecipes[set.1].recipe, recipe3: evaluatedRecipes[set.2].recipe, set: set))
            }
        }
        
        //sort based on evaluation
        evaluationsOfSets.sort { $0.evaluation > $1.evaluation }
        
        if size > 4 {
        //return 5 best sets
        for s in 0...4 {
            evaluationsOfSetsToReturn.append(evaluationsOfSets[s])
            }
        } else {
            evaluationsOfSetsToReturn = evaluationsOfSets
        }
        
        return evaluationsOfSetsToReturn
        
    }
    
    
    ///function evaluate set of recipes (for example (1,5,18)-corespond to recipe 1, 5 and 18
    ///
    /// - Returns: SetEvaulate object
    func evaluateSet(recipe1: Recipe, recipe2: Recipe, recipe3: Recipe, set: (Int,Int,Int)) -> SetEvalaute {
        var ingredientsInSet: [String] = []
        var evaluate: Int = 0
        
        //creatting array of all ingredients in set of recipes, checking only important ingredients
        //1 because they matter in termo of shoort expiration date
        //2 I dont want to create meal plan contating same not important ingredient (everyday pasta)
        for ingredientInRecipe1 in recipe1.getIngredientsImportantArray() {
            if !ingredientsInSet.contains(ingredientInRecipe1) {
                ingredientsInSet.append(ingredientInRecipe1)
            }
        }
        
        for ingredientInRecipe2 in recipe2.getIngredientsImportantArray() {
            if !ingredientsInSet.contains(ingredientInRecipe2) {
                ingredientsInSet.append(ingredientInRecipe2)
            }
        }
        
        for ingredientInRecipe3 in recipe3.getIngredientsImportantArray() {
            if !ingredientsInSet.contains(ingredientInRecipe3) {
                ingredientsInSet.append(ingredientInRecipe3)
            }
        }
        
        //If all 3 recipes contain ingredient set get 2 points, if 2 recipes contains same ingredient set get 1 point
        for ingredient in ingredientsInSet {
            if recipe1.getIngredientsImportantArray().contains(ingredient) && recipe2.getIngredientsImportantArray().contains(ingredient) &&
                recipe3.getIngredientsImportantArray().contains(ingredient) {
                evaluate += 2
            } else if recipe1.getIngredientsImportantArray().contains(ingredient) && recipe2.getIngredientsImportantArray().contains(ingredient) || recipe1.getIngredientsImportantArray().contains(ingredient) && recipe3.getIngredientsImportantArray().contains(ingredient) ||
                recipe2.getIngredientsImportantArray().contains(ingredient) && recipe3.getIngredientsImportantArray().contains(ingredient)  {
                    evaluate += 1
            }
        }
        
        let setEvaluate: SetEvalaute = SetEvalaute(set: set, evaluation: evaluate)
        
        return setEvaluate
    }
}

/// struct represent RecipeEvaluate object
///
/// - Author: Piotr Obara
/// - Version: 1.0
///
struct RecipeEvaluate {
    var recipe: Recipe
    var evaluation: Int
}

/// struct represent setEvaluate object
///
/// - Author: Piotr Obara
/// - Version: 1.0
///
struct SetEvalaute {
    var set: (Int,Int,Int)
    var evaluation: Int
}

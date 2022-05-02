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
    //var image: String?
    //var image_url: String?
    var user: ReceivedUser?
    var ingredients: [Ingredient]?
    var instructions: [Instruction]?
    //var comments: [Comment]?
    //var tags: [Tag]?
    //var likes: [Like]?
    var created_at: String?
    var updated_at: String?
}

struct RecipeReceived: Codable {
    var data: [Recipe]?
}

struct RecipeToSend: Codable {
    
    var name: String?
    var description: String?
    var cook_time: Int?
    var level: String?
    var number_of_servings: Int?
    var image: String?
    var ingredients: Ingredients?
    var instructions: Instructions?
    
}

struct Ingredients: Codable {
    
    var names: [String]?
    var amounts: [Float]?
    var metrics: [String]?
    var is_important_array: [Int]?
}

struct Instructions: Codable {
    
    var titles: [String]?
    var descriptions: [String]?
    var step_numbers: [Int]?
}

extension NetworkService {
    
    func addRecipe(recipe: Recipe, completion: @escaping (_ success: Recipe?) -> Void) {
        
        
        var ingredients: Ingredients = Ingredients(names: [String](), amounts: [Float](), metrics: [String](), is_important_array: [Int]())
        var instructions: Instructions = Instructions(titles: [String](), descriptions: [String](), step_numbers: [Int]())
        var recipeToSend = RecipeToSend()
        
        for ingredient in recipe.ingredients! {
            
            ingredients.names!.append(ingredient.name!)
            ingredients.amounts!.append(ingredient.amount!)
            ingredients.metrics!.append(ingredient.metric!)
            ingredients.is_important_array!.append(ingredient.is_important!)
        }
        
        for instruction in recipe.instructions! {
            
            instructions.titles!.append(instruction.title!)
            instructions.descriptions!.append(instruction.description!)
            instructions.step_numbers!.append(instruction.step_number!)
        }
        
        recipeToSend.name = recipe.name
        recipeToSend.description = recipe.description
        recipeToSend.cook_time = recipe.cook_time
        recipeToSend.level = recipe.level
        recipeToSend.number_of_servings = recipe.number_of_servings
        recipeToSend.ingredients = ingredients
        recipeToSend.instructions = instructions
        
        print(recipeToSend)
        
        AF.request(baseUrl + Endpoints.addRecipe.rawValue,
                   method: .post,
                   parameters: recipeToSend,
                   encoder: JSONParameterEncoder.default as JSONParameterEncoder,
                   headers: headers)
            .response { response in
                debugPrint(response)
                if response.data != nil {
                    
                    if response.response!.statusCode < 400 {
                        
                        do {
                            
                            let recipeReceived = try JSONDecoder().decode(Recipe.self, from: response.data!)
                            
                            print(recipeReceived)
                            completion(recipeReceived)
                            
                        } catch {
                            
                            completion(nil)
                        }
                    } else {
                        
                        
                        completion(nil)
                    }
                } else {
                    
                    completion(nil)
                }
            }
    }
    
    func editRecipe(recipe: RecipeToSend, recipeID: String,  completion: @escaping (_ success: Recipe?) -> Void) {
        
        let url = baseUrl + Endpoints.editRecipe.rawValue.replacingOccurrences(of: "{recipe}", with: recipeID)
        
        AF.request(url,
                   method: .patch,
                   parameters: recipe,
                   encoder: JSONParameterEncoder.default as JSONParameterEncoder,
                   headers: headers)
            .response { response in
                print("ResponseDATA")
                debugPrint(response.data)
                if response.data != nil {
                    
                    if response.response!.statusCode < 400 {
                        
                        do {
                            
                            let recipeReceived = try JSONDecoder().decode(Recipe.self, from: response.data!)
                            
                            completion(recipeReceived)
                            
                        } catch {
                            
                            completion(nil)
                        }
                    } else {
                        
                        completion(nil)
                    }
                    
                } else {
                    
                    completion(nil)
                }
            }
    }
    
    func getRecipe(recipeID: String, completion: @escaping (_ success: Recipe?) -> Void) {
        
        AF.request(baseUrl + Endpoints.getRecipe.rawValue.replacingOccurrences(of: "{recipe}", with: recipeID),
                   method: .get,
                   headers: headers).response { response in
                debugPrint(response)
                if response.data != nil {
                    print(response.data!)
                    if response.response!.statusCode < 400 {
                        
                        
                            
                            let recipe = try! JSONDecoder().decode(Recipe.self, from: response.data!)
                            print(recipe)
                            completion(recipe)
                        
                    } else {
                        
                        
                        completion(nil)
                    }
                } else {
                    
                    completion(nil)
                }
            }
    }
    
    func getCurrentUserRecipes(completion: @escaping (_ success: RecipeReceived?) -> Void) {
        
        AF.request(baseUrl + Endpoints.getCurrentUserRecipes.rawValue,
                   method: .get,
                   headers: headers)
            .response { response in
                debugPrint(response)
                if response.data != nil {
                    
                    if response.response!.statusCode < 400 {
                        
                            let recipesReceived = try! JSONDecoder().decode(RecipeReceived.self, from: response.data!)
                            
                            completion(recipesReceived)
                            
                        
                    } else {
                        
                        
                        completion(nil)
                    }
                } else {
                    
                    completion(nil)
                }
            }
    }
    
    func getAllRecipes(completion: @escaping (_ success: [Recipe]?) -> Void) {
        
        AF.request(baseUrl + Endpoints.getAllRecipes.rawValue,
                   method: .get,
                   headers: headers)
            .response { response in
                
                if response.data != nil {
                    
                    if response.response!.statusCode < 400 {
                        
                        
                            
                            let recipesReceived = try! JSONDecoder().decode([Recipe].self, from: response.data!)
                            
                            completion(recipesReceived)
                            
                        
                    } else {
                        
                        
                        completion(nil)
                    }
                } else {
                    
                    completion(nil)
                }
            }
    }
    
    func deleteRecipe(recipeID: String, completion: @escaping (_ success: Bool) -> Void) {
        
        let url = baseUrl + Endpoints.deleteRecipe.rawValue.replacingOccurrences(of: "{recipe}", with: recipeID)
        
        AF.request(url,
                   method: .delete,
                   headers: headers)
            .response { response in
                
                if response.data != nil {
                    
                    if response.response!.statusCode < 400 {
                        
                            completion(true)
                    } else {
                        
                        
                        completion(false)
                    }
                } else {
                    
                    completion(false)
                }
            }
    }
    
}



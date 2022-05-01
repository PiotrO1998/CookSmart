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
    var ingredients: [Ingredient]?
    var instructions: [Instruction]?
    var comments: [Comment]?
    var tags: [Tag]?
    var likes: [Like]?
    var created_at: String?
    var updated_at: String?
}

struct RecipeToSend: Codable {
    
    var name: String?
    var description: String?
    var cook_time: Int?
    var level: String?
    var number_of_servings: Int?
    var image: String?
    
}

struct ingredients: Codable {
    
    var names: [String]?
    var amounts: [Int]?
    var metrics: [String]?
    var is_important_array: [String]?
}

struct instructions: Codable {
    
    var titles: [String]?
    var descriptions: [String]?
    var step_numbers: [Int]?
}

extension NetworkService {
    
    func addRecipe(recipe: RecipeToSend, completion: @escaping (_ success: Recipe?) -> Void) {
        
        AF.request(baseUrl + Endpoints.addRecipe.rawValue,
                   method: .post,
                   parameters: recipe,
                   encoder: JSONParameterEncoder.default as JSONParameterEncoder)
            .response { response in
                
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
    
    func editRecipe(recipe: RecipeToSend, recipeID: String,  completion: @escaping (_ success: Recipe?) -> Void) {
        
        let url = baseUrl + Endpoints.editRecipe.rawValue.replacingOccurrences(of: "{recipe}", with: recipeID)
        
        AF.request(url,
                   method: .patch,
                   parameters: recipe,
                   encoder: JSONParameterEncoder.default as JSONParameterEncoder,
                   headers: headers)
            .response { response in
                debugPrint(response)
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
        
        AF.request(baseUrl + Endpoints.getRecipe.rawValue + recipeID,
                   method: .get)
            .response { response in
                
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
    
    func getCurrentUserRecipes(completion: @escaping (_ success: [Recipe]?) -> Void) {
        
        AF.request(baseUrl + Endpoints.getCurrentUserRecipes.rawValue,
                   method: .get)
            .response { response in
                
                if response.data != nil {
                    
                    if response.response!.statusCode < 400 {
                        
                        do {
                            
                            let recipesReceived = try JSONDecoder().decode([Recipe].self, from: response.data!)
                            
                            completion(recipesReceived)
                            
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
    
    func getAllRecipes(completion: @escaping (_ success: [Recipe]?) -> Void) {
        
        AF.request(baseUrl + Endpoints.getAllRecipes.rawValue,
                   method: .get)
            .response { response in
                
                if response.data != nil {
                    
                    if response.response!.statusCode < 400 {
                        
                        do {
                            
                            let recipesReceived = try JSONDecoder().decode([Recipe].self, from: response.data!)
                            
                            completion(recipesReceived)
                            
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
    
    func deleteRecipe(recipeID: String, completion: @escaping (_ success: Bool) -> Void) {
        
        let url = baseUrl + Endpoints.deleteRecipe.rawValue.replacingOccurrences(of: "{recipe}", with: recipeID)
        
        AF.request(url,
                   method: .delete)
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



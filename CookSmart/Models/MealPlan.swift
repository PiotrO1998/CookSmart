//
//  MealPlan.swift
//  CookSmart
//
//

import Foundation
import Alamofire

struct MealPlan: Codable {
    
    var id: Int?
    var name: String?
    var description: String?
    var user: User?
    var recipes: [Recipe]?
    var comments: [Comment]?
    var tags: [Tag]?
    var likes: [Like]?
    var created_at: String?
    var updated_at: String?
}

struct MealPlanToSend: Codable {
    
    var name: String?
    var description: String?
    var ids: [Int]?
}

struct ReceivedMealPlans: Codable {
    
    var data: [MealPlan]?
}

extension NetworkService {
    
    func addMealPlan(mealplan: MealPlanToSend, completion: @escaping (_ success: MealPlan?) -> Void) {
        
        AF.request(baseUrl + Endpoints.addMealPlan.rawValue,
                   method: .post,
                   parameters: mealplan,
                   encoder: JSONParameterEncoder.default as JSONParameterEncoder,
                   headers: headers)
            .response { response in
                debugPrint(response)
                if response.data != nil {
                    
                    if response.response!.statusCode < 400 {
                        
                        do {
                            
                            let mealPlanReceived = try JSONDecoder().decode(MealPlan.self, from: response.data!)
                            
                            completion(mealPlanReceived)
                            
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
    
    func editMealPlan(mealPlan: MealPlanToSend, mealPlanID: String, completion: @escaping (_ success: MealPlan?) -> Void) {
        
        let url = baseUrl + Endpoints.editMealPlan.rawValue.replacingOccurrences(of: "{mealplan}", with: mealPlanID)
        
        AF.request(url,
                   method: .patch,
                   parameters: mealPlan,
                   encoder: JSONParameterEncoder.default as JSONParameterEncoder,
                   headers: headers)
            .response { response in
                debugPrint(response)
                if response.data != nil {
                    
                    if response.response!.statusCode < 400 {
                        
                        do {
                            
                            let mealPlanReceived = try JSONDecoder().decode(MealPlan.self, from: response.data!)
                            
                            completion(mealPlanReceived)
                            
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
    
    func getMealPlan(mealPlanID: String, completion: @escaping (_ success: MealPlan?) -> Void) {
        
        AF.request(baseUrl + Endpoints.getMealPlan.rawValue.replacingOccurrences(of: "{mealplan}", with: mealPlanID),
                   method: .get,
                   headers: headers)
            .response { response in
                
                if response.data != nil {
                    
                    if response.response!.statusCode < 400 {
                        
                        do {
                            
                            let mealPlanReceived = try JSONDecoder().decode(MealPlan.self, from: response.data!)
                            
                            completion(mealPlanReceived)
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
    
    func getCurrentUserMealPlans(completion: @escaping (_ success: [MealPlan]?) -> Void) {
        
        AF.request(baseUrl + Endpoints.getCurrentUserMealPlans.rawValue,
                   method: .get,
                   headers: headers)
            .response { response in
                debugPrint(response)
                if response.data != nil {
                    
                    if response.response!.statusCode < 400 {
                        
                        do {
                            
                            let mealPlansReceived = try JSONDecoder().decode(ReceivedMealPlans.self, from: response.data!)
                            
                            completion(mealPlansReceived.data)
                            
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
    
    func getAllMealPlans(completion: @escaping (_ success: [MealPlan]?) -> Void) {
        
        AF.request(baseUrl + Endpoints.getAllMealPlans.rawValue,
                   method: .get,
                   headers: headers)
            .response { response in
                debugPrint(response)
                if response.data != nil {
                    
                    if response.response!.statusCode < 400 {
                        
                        do {
                            
                            let mealPlansReceived = try JSONDecoder().decode(ReceivedMealPlans.self, from: response.data!)
                            
                            completion(mealPlansReceived.data)
                            
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
    
    func deleteMealPlan(mealPlanID: String, completion: @escaping (_ success: Bool) -> Void) {
        
        let url = baseUrl + Endpoints.deleteMealPlan.rawValue.replacingOccurrences(of: "{mealplan}", with: mealPlanID)
        
        AF.request(url,
                   method: .delete,
                   headers: headers)
            .response { response in
                debugPrint(response)
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
    
    func deleteRecipeFromMealPlan(mealPlanID: String, recipeID: String, completion: @escaping (_ success: Bool) -> Void) {
        
        let url = baseUrl + Endpoints.deleteRecipeFromMealPlan.rawValue.replacingOccurrences(of: "{mealplan}", with: mealPlanID).replacingOccurrences(of: "{recipe}", with: recipeID)
        
        AF.request(url,
                   method: .patch,
                   headers: headers)
            .response { response in
                debugPrint(response)
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

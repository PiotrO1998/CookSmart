//
//  NetworkService.swift
//  CookSmart
//
//

import Foundation
import Alamofire

struct NetworkService {

    let baseUrl = "http://192.168.200.22/api/"

    var headers: HTTPHeaders = []

    init() {
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        
        headers = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(token)"
        ]
    }
    
    enum Endpoints: String {
        
        // User
        case registerUser = "register"
        case signInUser = "sanctum/token"
        case signOut = "sign-out"
        case getUserProfile = "user/profile"
        case updateUserProfile = "user/update-profile"
        case deleteUserProfile = "user/delete"
        
        // Recipe
        case addRecipe = "recipe/store"
        case editRecipe = "recipe/{recipe}/update"
        case getCurrentUserRecipes = "recipes-all-user"
        case getAllRecipes = "recipes-all"
        case deleteRecipe = "recipe/{recipe}/delete"
        
        // Meal Plan
        case addMealPlan = "meal-plans/store"
        case editMealPlan = "mealplan/{mealplan/update"
        case getCurrentUserMealPlans = "meal-plans-all-user"
        case getAllMealPlans = "meal-plans-all"
        case deleteMealPlan = "mealplan/{mealplan}/delete"
        
    }
}

struct Token: Codable {
    
    var token: String?
}

struct ErrorResponse: Codable {
    
    var errors: String?
}

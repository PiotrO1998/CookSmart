//
//  User.swift
//  CookSmart
//
//

import Foundation
import Alamofire

public class User: Codable {
    
    var id: Int?
    var first_name: String?
    var surname: String?
    var username: String?
    var email: String?
    var password: String?
    var device_name: String?
    
    init(id: Int?, first_name: String?, surname: String, username: String? ,email: String?, password: String?) {
        
        self.id = id
        self.first_name = first_name
        self.surname = surname
        self.username = username
        self.email = email
        self.password = password
    }
    
    init(first_name: String?, surname: String, username: String? ,email: String?, password: String?, device_name: String?) {
        
        self.first_name = first_name
        self.surname = surname
        self.username = username
        self.email = email
        self.password = password
        self.device_name = device_name
    }
    
    init(email: String?, password: String?, device_name: String?) {
        
        self.email = email
        self.password = password
    }
    
}

public class CurrentUserDefaults {
    
    static let shared = CurrentUserDefaults()
    
    func saveCurrntUserToUserDefaults(user: User) {
        
        let userData = try! JSONEncoder().encode(user)
        UserDefaults.standard.set(userData, forKey: "currentUser")
        //UserDefaults.standard.synchronize()
    }
    
    func getCurrentUser() -> User? {
        
        if let currentUser = UserDefaults.standard.object(forKey: "currentUser") as? Data {
            
            let decodeCurrentUser = try! JSONDecoder().decode(User.self, from: currentUser)
            
            return decodeCurrentUser
        }
        
        return nil
    }
}

extension NetworkService {
    
    func registeruser(user: User, completion: @escaping (_ success: Bool) -> Void) {
        
        AF.request(baseUrl + Endpoints.registerUser.rawValue,
                   method: .post,
                   parameters: user,
                   encoder: JSONParameterEncoder.default as JSONParameterEncoder)
            .response { response in
                
                if response.data != nil {
                    
                    if response.response!.statusCode < 400 {
                        
                        do {
                            
                            let data = try JSONDecoder().decode(Token.self, from: response.data!)
                            
                            UserDefaults.standard.set(data.token, forKey: "token")
                            //UserDefaults.standard.synchronize()
                            completion(true)
                            
                        } catch {
                            
                            completion(false)
                        }
                    } else {
                        
                        completion(true)
                    }
                    
                } else {
                    
                    completion(true)
                }
            }
    }
    
    func signInUser(user: User, completion: @escaping (_ success: Bool) -> Void) {
        
        AF.request(baseUrl + Endpoints.signInUser.rawValue,
                   method: .post,
                   parameters: user,
                   encoder: JSONParameterEncoder.default as JSONParameterEncoder)
            .response { response in
                
                if response.data != nil {
                    
                    if response.response!.statusCode < 400 {
                        
                        do {
                            
                            let data = try JSONDecoder().decode(Token.self, from: response.data!)
                            
                            UserDefaults.standard.set(data.token, forKey: "token")
                            //UserDefaults.standard.synchronize()
                            completion(true)
                            
                        } catch {
                            
                            completion(false)
                        }
                    } else {
                        
                        completion(true)
                    }
                    
                } else {
                    
                    completion(true)
                }
            }
    }
    
    
}

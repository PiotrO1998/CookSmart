//
//  MyRecipesViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 02/05/2022.
//

import UIKit

class MyRecipesViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var recipes: [Recipe]?

    override func viewDidLoad() {
        super.viewDidLoad()

        getRecipes()
        getUser()
        getAllRecipes()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    private func getRecipes() {
        
        NetworkService().getRecipe(recipeID: "13") { recipe in
            print(recipe)
            if recipe != nil {
                
                if recipe!.image_url != nil {
                    print("hereeee")
                    print("URL" + recipe!.image_url!)
                    
                    var urlll = NetworkService().baseUrl + recipe!.image_url!
                    print(urlll)
                    
                    NetworkService().dimage(from: URL(string: recipe!.image_url!)!) { image in
                        
                        if image != nil {
                            
                            self.imageView.image = image!
                        }
                    }
                }
                
            }
            
        }
    }
    
    func getUser() {
        
        NetworkService().getUserProfile { user in
            
            if user != nil {
                
                print("USER")
                print(user!.username)
            }
            
            
        }
    }
    
    
    func getAllRecipes() {
        
        NetworkService().getAllRecipes { recipes in
            
            if recipes != nil {
                
                print(recipes!.count)
            }
            
        }
    }
    
}

//
//  RecipeViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 15/04/2021.
//

import UIKit

class RecipeViewController: UIViewController {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeCookingTime: UILabel!
    @IBOutlet weak var recipeLevel: UILabel!
    @IBOutlet weak var recipeServing: UILabel!
    
    @IBOutlet weak var recipeIngredients: UILabel!
    
    @IBOutlet weak var recipeCookingInstructions: UILabel!
    
    
    
    var rImage = #imageLiteral(resourceName: "Broccoli Pasta")
    var rName: String?
    var rCookingTime: String?
    var rLevel: String?
    var rServings: String?
    var rIngredients: String?
    var rCookingInstructions: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeImage.contentMode = .scaleToFill
        
        //view.backgroundColor = .blue
        //let label = UILabel()
        //label.text = name
        //label.frame = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        //view.addSubview(label)
        
        if let text = rName, let cookingTime = rCookingTime, let level = rLevel, let servings = rServings, let ingredients = rIngredients, let cokingInstructions = rCookingInstructions {
            self.recipeImage.image = rImage
            self.recipeName.text = text
            self.recipeCookingTime.text = cookingTime
            self.recipeLevel.text = level
            self.recipeServing.text = "Servings: " + servings
            self.recipeIngredients.text = ingredients
            self.recipeCookingInstructions.text = cokingInstructions
        }

        //recipeName.text = ""
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

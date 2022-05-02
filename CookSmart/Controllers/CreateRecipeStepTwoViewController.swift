//
//  CreateRecipeViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 01/05/2022.
//

import UIKit

class CreateRecipeStepTwoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var recipeName: String!
    var recipeCookTime: Int!
    var recipeLevel: String!
    var recipeServings: Int!
    
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionTextView.layer.cornerRadius = 5
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        if descriptionTextView.text.count > 0 {
        
        performSegue(withIdentifier: "segue-to-create-recipe-step-three", sender: self)
        } else {
            
            showAlert(text: "Please add description")
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segue-to-create-recipe-step-three" {
            
            let destination = segue.destination as! CreateRecipeStepThreeViewController
            destination.recipeName = recipeName
            destination.recipeCookTime = recipeCookTime
            destination.recipeLevel = recipeLevel
            destination.recipeServings = recipeServings
            destination.recipeDescription = descriptionTextView.text
            
            
        }
    }
    
    func showAlert(text: String) {
        
        let alert = UIAlertController(title: text, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
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

//
//  CreateRecipeStepThreeViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 02/05/2022.
//

import UIKit

class CreateRecipeStepThreeViewController: UIViewController {
    
    var recipeImageString: String?
    var recipeDescription: String?
    
    @IBOutlet weak var newIngredientButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newIngredientButton.layer.cornerRadius = 5
        newIngredientButton.layer.borderWidth = 1
        newIngredientButton.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func newIngredientButtonTapped(_ sender: UIButton) {
        
        
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

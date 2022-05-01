//
//  ProfileViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 01/05/2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func editProfileButtonTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: sequeToEditProfile, sender: self)
    }
    
    @IBAction func createRecipeButtontapped(_ sender: UIButton) {
    }
    
    @IBAction func MyRecipesButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func createMealPlanButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func myMealPlansButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func signOutButtonTapped(_ sender: UIButton) {
    }
    
    

   

}

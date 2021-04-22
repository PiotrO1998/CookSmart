//
//  CreateMealPlanViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 17/04/2021.
//

import UIKit

class CreateMealPlanViewController: UIViewController {
    
    @IBOutlet weak var buttonVegetarian: UIButton!
    @IBOutlet weak var buttonNonVegetarian: UIButton!
    @IBOutlet weak var buttonNext: UIButton!
    
    var buttonVegPressed = false
    var buttonNonVegPressed = false
    
    override func viewDidAppear(_ animated: Bool) {
        print("View did apper " + String(buttonVegPressed))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonVegetarian.backgroundColor = .clear
        buttonVegetarian.layer.cornerRadius = 5
        buttonVegetarian.layer.borderWidth = 1
        buttonVegetarian.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)
        
        buttonNonVegetarian.backgroundColor = .clear
        buttonNonVegetarian.layer.cornerRadius = 5
        buttonNonVegetarian.layer.borderWidth = 1
        buttonNonVegetarian.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)
        // Do any additional setup after loading the view.
        
        print("View did load " + String(buttonVegPressed))
    }
    
    @IBAction func buttonVegetarianPressed(_ sender: UIButton) {
        if !buttonVegPressed {
            buttonVegetarian.backgroundColor = UIColor(named: Constants.AppNames.colorOrange)
            buttonVegetarian.setTitleColor(UIColor.white, for: .normal)
            buttonVegPressed = true
            print("func " + String(buttonVegPressed))
        } else {
            buttonVegetarian.backgroundColor = .clear
            buttonVegetarian.setTitleColor(UIColor(named: "ColorOrange"), for: .normal)
            buttonVegPressed = false
            print("func " + String(buttonVegPressed))
        }
        
    }
    
    @IBAction func buttonNonVegetarianPressed(_ sender: UIButton) {
        if !buttonNonVegPressed {
            buttonNonVegetarian.backgroundColor = UIColor(named: Constants.AppNames.colorOrange)
            buttonNonVegetarian.setTitleColor(UIColor.white, for: .normal)
            buttonNonVegPressed = true
        } else {
            buttonNonVegetarian.backgroundColor = .clear
            buttonNonVegetarian.setTitleColor(UIColor(named: "ColorOrange"), for: .normal)
            buttonNonVegPressed = false
        }
    }
    
    @IBAction func buttonNextPressed(_ sender: UIButton) {
        
        if !buttonVegPressed && !buttonNonVegPressed {
        
        let alert = UIAlertController(title: "You Need To Chose At Leat One Type", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
            
        } else {
            
            ConfigureMealPlan.vegetarian = buttonVegPressed
            ConfigureMealPlan.nonVegetarian = buttonNonVegPressed
            
            self.performSegue(withIdentifier: Constants.AppNames.sequeToCookingTimeIndentifier, sender: self)
            }
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



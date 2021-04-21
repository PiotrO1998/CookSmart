//
//  ChoseCookingLevelViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 21/04/2021.
//

import UIKit

class ChoseCookingLevelViewController: UIViewController {
    
    @IBOutlet weak var buttonEasy: UIButton!
    @IBOutlet weak var buttonMedium: UIButton!
    @IBOutlet weak var buttonHard: UIButton!
    
    
    var bEasyPressed = false
    var bMediumPressed = false
    var bHardPressed = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonEasy.backgroundColor = .clear
        buttonEasy.layer.cornerRadius = 5
        buttonEasy.layer.borderWidth = 1
        buttonEasy.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)
        
        buttonMedium.backgroundColor = .clear
        buttonMedium.layer.cornerRadius = 5
        buttonMedium.layer.borderWidth = 1
        buttonMedium.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)
        
        buttonHard.backgroundColor = .clear
        buttonHard.layer.cornerRadius = 5
        buttonHard.layer.borderWidth = 1
        buttonHard.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonEasyPressed(_ sender: UIButton) {
        if !bEasyPressed {
            buttonEasy.backgroundColor = UIColor(named: Constants.AppNames.colorOrange)
            buttonEasy.setTitleColor(UIColor.white, for: .normal)
            bEasyPressed = true
        } else {
            buttonEasy.backgroundColor = .clear
            buttonEasy.setTitleColor(UIColor(named: "ColorOrange"), for: .normal)
            bEasyPressed = false
        }
    }
    
    @IBAction func buttonMediumPressed(_ sender: UIButton) {
        if !bMediumPressed {
            buttonMedium.backgroundColor = UIColor(named: Constants.AppNames.colorOrange)
            buttonMedium.setTitleColor(UIColor.white, for: .normal)
            bMediumPressed = true
        } else {
            buttonMedium.backgroundColor = .clear
            buttonMedium.setTitleColor(UIColor(named: "ColorOrange"), for: .normal)
            bMediumPressed = false
        }
    }
    
    @IBAction func buttonHardPressed(_ sender: UIButton) {
        if !bHardPressed {
            buttonHard.backgroundColor = UIColor(named: Constants.AppNames.colorOrange)
            buttonHard.setTitleColor(UIColor.white, for: .normal)
            bHardPressed = true
        } else {
            buttonHard.backgroundColor = .clear
            buttonHard.setTitleColor(UIColor(named: "ColorOrange"), for: .normal)
            bHardPressed = false
        }
    }
    
    
    
    @IBAction func buttonNextPressed(_ sender: Any) {
        
        if !bEasyPressed && !bMediumPressed && !bHardPressed {
            
            let alert = UIAlertController(title: "You Need To Chose At Leat One Option", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
                
            } else {
                
                ConfigureMealPlan.easy = bEasyPressed
                ConfigureMealPlan.medium = bMediumPressed
                ConfigureMealPlan.hard = bHardPressed
                
                self.performSegue(withIdentifier: Constants.AppNames.sequeToNumberOfServingsIndentifier, sender: self)
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

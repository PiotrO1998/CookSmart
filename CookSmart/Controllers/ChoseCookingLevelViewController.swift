
import UIKit

/// struct represent ChoseCookingLevelViewController object
///
///
///  - Author: Piotr Obara
///  - Version: 1.0
///
class ChoseCookingLevelViewController: UIViewController {
    
    @IBOutlet weak var buttonEasy: UIButton!
    @IBOutlet weak var buttonMedium: UIButton!
    @IBOutlet weak var buttonHard: UIButton!
    @IBOutlet weak var buttonNext: UIButton!
    
    
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
        
        buttonNext.backgroundColor = .clear
        buttonNext.layer.cornerRadius = 5
        buttonNext.layer.borderWidth = 1
        buttonNext.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)

        // Do any additional setup after loading the view.
    }
    
    ///function is called when button easy is pressed
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
    
    ///function is called when button medium is pressed
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
    
    ///function is called when button hard is pressed
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
    
    ///function is called when button next is pressed
    @IBAction func buttonNextPressed(_ sender: Any) {
        if !bEasyPressed && !bMediumPressed && !bHardPressed {
            let alert = UIAlertController(title: "You Need To Choose At Leat One Option", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
                
            } else {
                ConfigureMealPlan.easy = bEasyPressed
                ConfigureMealPlan.medium = bMediumPressed
                ConfigureMealPlan.hard = bHardPressed
                self.performSegue(withIdentifier: Constants.AppNames.sequeToIngredientsIndentifier, sender: self)
                }
         }
}

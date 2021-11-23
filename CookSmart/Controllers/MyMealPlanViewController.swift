

import UIKit

/// class represent MyMealPlanViewController object
///
///
///  - Author: Piotr Obara
///  - Version: 1.0
///
class MyMealPlanViewController: UIViewController {
    @IBOutlet weak var meMealPlansButton: UIButton!
    @IBOutlet weak var createMealPlanButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        meMealPlansButton.backgroundColor = .clear
        meMealPlansButton.layer.cornerRadius = 5
        meMealPlansButton.layer.borderWidth = 1
        meMealPlansButton.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        createMealPlanButton.backgroundColor = .clear
        createMealPlanButton.layer.cornerRadius = 5
        createMealPlanButton.layer.borderWidth = 1
        createMealPlanButton.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)

        
    }
    
    @IBAction func myMealsPlansButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func createMealPlanButtonPressed(_ sender: UIButton) {
    }
}

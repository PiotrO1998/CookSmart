//
//  MyMealPlanViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 17/04/2021.
//

import UIKit

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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func myMealsPlansButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func createMealPlanButtonPressed(_ sender: UIButton) {
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

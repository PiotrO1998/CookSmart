//
//  ChoseNumberOfServingsViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 21/04/2021.
//

import UIKit

class ChoseNumberOfServingsViewController: UIViewController {
    
    @IBOutlet weak var labelNumberOfServings: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
    @IBAction func stepperPressed(_ sender: UIStepper) {
        labelNumberOfServings.text = String(format: "%.f", stepper.value)
    }
    
}

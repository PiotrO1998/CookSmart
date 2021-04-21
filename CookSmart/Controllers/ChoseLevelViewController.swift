//
//  ChoseLevelViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 21/04/2021.
//

import UIKit

class ChoseLevelViewController: UIViewController {
    
    @IBOutlet weak var button30: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button15: UIButton!
    
    var b30Pressed = false
    var b1Pressed = false
    var b15Pressed = false
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button30.backgroundColor = .clear
        button30.layer.cornerRadius = 5
        button30.layer.borderWidth = 1
        button30.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)
        
        button1.backgroundColor = .clear
        button1.layer.cornerRadius = 5
        button1.layer.borderWidth = 1
        button1.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)
        
        button15.backgroundColor = .clear
        button15.layer.cornerRadius = 5
        button15.layer.borderWidth = 1
        button15.layer.borderColor = #colorLiteral(red: 1, green: 0.8146176558, blue: 0.3191613718, alpha: 1)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func button30Pressed(_ sender: UIButton) {
        if !b30Pressed {
            button30.backgroundColor = UIColor(named: Constants.AppNames.colorOrange)
            button30.setTitleColor(UIColor.white, for: .normal)
            b30Pressed = true
        } else {
            button30.backgroundColor = .clear
            button30.setTitleColor(UIColor(named: "ColorOrange"), for: .normal)
            b30Pressed = false
        }
    }
    
    @IBAction func button1Pressed(_ sender: UIButton) {
        if !b1Pressed {
            button1.backgroundColor = UIColor(named: Constants.AppNames.colorOrange)
            button1.setTitleColor(UIColor.white, for: .normal)
            b1Pressed = true
        } else {
            button1.backgroundColor = .clear
            button1.setTitleColor(UIColor(named: "ColorOrange"), for: .normal)
            b1Pressed = false
        }
    }
    
    @IBAction func button15Pressed(_ sender: UIButton) {
        if !b15Pressed {
            button15.backgroundColor = UIColor(named: Constants.AppNames.colorOrange)
            button15.setTitleColor(UIColor.white, for: .normal)
            b15Pressed = true
        } else {
            button15.backgroundColor = .clear
            button15.setTitleColor(UIColor(named: "ColorOrange"), for: .normal)
            b15Pressed = false
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

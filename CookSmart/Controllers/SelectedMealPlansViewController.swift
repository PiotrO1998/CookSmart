//
//  SelectedRecipesViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 22/04/2021.
//

import UIKit

class SelectedMealPlansViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonDone: UIButton!
    
    
    var recipes: [Recipe] = []
    var ingredients: [String] = []
    var selectedMealPlans: [[Recipe]] = []
    var savedMealPlans: [[String]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationItem.hidesBackButton = true
        
        buttonDone.backgroundColor = .clear
        buttonDone.layer.cornerRadius = 5
        buttonDone.layer.borderWidth = 1
        buttonDone.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //Register Table View
        tableView.register(UINib(nibName: Constants.AppNames.mealPlanCellNibName, bundle: nil), forCellReuseIdentifier: Constants.AppNames.selectedMealPlanCellIndentifier)

        let selectMealPlans: SelectMealPlans = SelectMealPlans(recipes: recipes, ingredietns: ingredients)
        selectedMealPlans = selectMealPlans.getMealPlans()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let selectMealPlans: SelectMealPlans = SelectMealPlans(recipes: recipes, ingredietns: ingredients)
        selectedMealPlans = selectMealPlans.getMealPlans()
    }
    
    //function is called when user pressed button
    //function save mealPlans on the phone
    @IBAction func buttonDonePressed(_ sender: UIButton) {
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "MyMealPlansViewController") as! MyMealPlansViewController
        
        //vc.recipe = recipesData.recipes[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
   }
    
    // function add mealPlan to array of saved meal plan if not aleardy in array
    func addToSavedMealPlansIfNotAdded(mealPlan: [String]) {
        
        if UserDefaults.standard.object(forKey: "savedMealPlans") != nil {
            var allMealsPlans: [[String]] = UserDefaults.standard.object(forKey: "savedMealPlans") as! [[String]]
            
            if allMealsPlans.count == 0 {
                allMealsPlans.append(mealPlan)
            } else {
                if !allMealsPlans.contains(mealPlan) {
                    allMealsPlans.append(mealPlan)
                    }
                }
                
            UserDefaults.standard.set(allMealsPlans, forKey: "savedMealPlans")
            print("added old")
            for i in allMealsPlans {
                print(i)
            }
        } else {
            var arrayOfMealsToSave: [[String]] = []
            arrayOfMealsToSave.append(mealPlan)
            UserDefaults.standard.set(arrayOfMealsToSave, forKey: "savedMealPlans")
            print("added new")
            for i in arrayOfMealsToSave {
                print(i)
                }
            }
        }
    }

extension SelectedMealPlansViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        selectedMealPlans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.AppNames.selectedMealPlanCellIndentifier, for: indexPath) as! MealPlanCell
        
        cell.imageLeft.image = selectedMealPlans[indexPath.row][0].image
        cell.nameLeft.text = selectedMealPlans[indexPath.row][0].name
        
        cell.imageMiddle.image = selectedMealPlans[indexPath.row][1].image
        cell.nameMiddle.text = selectedMealPlans[indexPath.row][1].name
        
        cell.imageRight.image = selectedMealPlans[indexPath.row][2].image
        cell.nameRight.text = selectedMealPlans[indexPath.row][2].name
        
        return cell
        }
    }

extension SelectedMealPlansViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let add = UIContextualAction(style: .normal, title: "Add") { (action, view, completitionHandler) in
             self.addToSavedMealPlansIfNotAdded(mealPlan: [self.selectedMealPlans[indexPath.row][0].name, self.selectedMealPlans[indexPath.row][1].name, self.selectedMealPlans[indexPath.row][2].name])
            completitionHandler(true)
        }
        
        add.image = UIImage(systemName: "bookmark.circle.fill")
        add.backgroundColor = UIColor(named: Constants.AppNames.colorOrange)
        
        //swipe action
        let swipe = UISwipeActionsConfiguration(actions: [add])
        return swipe
    }
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "MealPlanViewController") as! MealPlanViewController
        vc.recipes = selectedMealPlans[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

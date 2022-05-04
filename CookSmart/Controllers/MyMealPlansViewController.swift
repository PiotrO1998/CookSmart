//
//  MyMealPlansViewController.swift
//  CookSmart
//
//

import UIKit

class MyMealPlansViewController: UIViewController {
    
    var myMealPlans: [MealPlan]!
    var tappedMealPlan: MealPlan?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue-to-meal-plan-recipes" {
            
            let vc = segue.destination as! MealPlanRecipesViewController
            if tappedMealPlan != nil {
                vc.mealPlan = tappedMealPlan
            }
        }
    }
}

extension MyMealPlansViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        myMealPlans!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let myMealPlan = myMealPlans[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealPlanCell", for: indexPath) as! MealPlanTableViewCell
        cell.mealPlanName.text = myMealPlan.name
        cell.mealPlanDescription.text = myMealPlan.description
        return cell
    }
}

extension MyMealPlansViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        NetworkService().getMealPlan(mealPlanID: String(self.myMealPlans[indexPath.row].id!)) { mealPlan in
            
            if mealPlan != nil {
            
            self.tappedMealPlan = mealPlan
            self.performSegue(withIdentifier: "segue-to-meal-plan-recipes", sender: self)
            }
        /*
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "RecipeViewController") as! RecipeViewController
        vc.recipe = recipes![indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
         */
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completitionHandler) in
            
            NetworkService().deleteMealPlan(mealPlanID: String(self.myMealPlans[indexPath.row].id!)) { success in
                
                if success {
                    self.myMealPlans!.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                    completitionHandler(true)
                }
            }
            
            /*
            self.ingredients.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            completitionHandler(true)
             */
        }
        
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        return swipe
    }
}

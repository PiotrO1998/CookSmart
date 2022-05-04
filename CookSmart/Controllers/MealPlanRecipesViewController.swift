//
//  MealPlanRecipesViewController.swift
//  CookSmart
//
//

import UIKit

class MealPlanRecipesViewController: UIViewController {

    var mealPlan: MealPlan!
    var recipes: [Recipe]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recipes = mealPlan.recipes
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}

extension MealPlanRecipesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        recipes!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyRecipeCell", for: indexPath) as! RecipeTableViewCell
        cell.recipeName.text = "Name: " + recipes![indexPath.row].name!
        cell.recipeCookTime.text = "Cook time: \(recipes![indexPath.row].cook_time!)"
        cell.recipeLevel.text = "Level: " + recipes![indexPath.row].level!
        return cell
    }
}

extension MealPlanRecipesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "RecipeViewController") as! RecipeViewController
        vc.recipe = recipes![indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completitionHandler) in
            
            // add endpoint
            NetworkService().deleteRecipeFromMealPlan(mealPlanID: String(self.mealPlan!.id!), recipeID: String(self.recipes![indexPath.row].id!)) { success in
                
                if success {
                    self.recipes?.remove(at: indexPath.row)
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

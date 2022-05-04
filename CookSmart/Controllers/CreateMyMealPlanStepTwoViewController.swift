//
//  CreateMyMealPlanStepTwoViewController.swift
//  CookSmart
//
//

import UIKit

class CreateMyMealPlanStepTwoViewController: UIViewController {
    
    var mealPlanName: String!
    var des: String!
    var recipes: [Recipe]?
    var mealPlansModel: [MealPlanModel] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupModel()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func setupModel() {
        for recipe in recipes! {
            let mealPlanModel = MealPlanModel(id: recipe.id!, isSelected: false)
            mealPlansModel.append(mealPlanModel)
        }
    }
    @IBAction func addMealPlanButtonTapped(_ sender: UIButton) {
        
        var idsOfRecipes = [Int]()
        
        for m in mealPlansModel {
            if m.isSelected {
                idsOfRecipes.append(m.id)
            }
        }
        
        if idsOfRecipes.count > 1 {
            
            let mealPlanToSend = MealPlanToSend(name: mealPlanName!, description: des!, ids: idsOfRecipes)
            print("MEAL PLAN SEND")
            print(mealPlanToSend)
            NetworkService().addMealPlan(mealplan: mealPlanToSend) { mealPlan in
                
                if mealPlan != nil {
                    
                    self.performSegue(withIdentifier: "unwind-to-cook-book-from-create-meal-plan-step-two", sender: self)
                    self.showAlert(text: "Meal plan added")
                } else {
                    
                    self.showAlert(text: "Something went wrong")
                    self.performSegue(withIdentifier: "unwind-to-cook-book-from-create-meal-plan-step-two", sender: self)
                }
                
            }
            
        } else {
            
            showAlert(text: "You need to choose at least two recipes.")
        }
        
        
    }
    
    func showAlert(text: String) {
        
        let alert = UIAlertController(title: text, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}



extension CreateMyMealPlanStepTwoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        recipes!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeWithCircle", for: indexPath) as! RecipeWithImageTableViewCell
        cell.recipeName.text = "Name: " + recipes![indexPath.row].name!
        cell.recipeCookTime.text = "Cook time: \(recipes![indexPath.row].cook_time!)"
        cell.recipeLevel.text = "Level: " + recipes![indexPath.row].level!
        
        
        cell.circle.image = mealPlansModel[indexPath.row].isSelected == true ? UIImage(named: "circle") : UIImage(named: "circleEmpty")
        
        return cell
    }
}

extension CreateMyMealPlanStepTwoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeWithCircle", for: indexPath) as! RecipeWithImageTableViewCell
        
        
        
        if mealPlansModel[indexPath.row].isSelected == false {
            mealPlansModel[indexPath.row].isSelected = true
        } else {
            mealPlansModel[indexPath.row].isSelected = false
        }
        print("HERE " )
        print(mealPlansModel[indexPath.row].isSelected)
        
        
        cell.circle.image = self.mealPlansModel[indexPath.row].isSelected == true ? UIImage(named: "circle") : UIImage(named: "circleEmpty")
        
        tableView.reloadData()
        
    }
    
    /*
     func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
     
     let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completitionHandler) in
     
     NetworkService().deleteRecipe(recipeID: String(self.recipes![indexPath.row].id!)) { success in
     
     if success {
     self.recipes?.remove(at: indexPath.row)
     tableView.reloadData()
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
     */
    
}

struct MealPlanModel {
    
    var id: Int
    var isSelected: Bool
}






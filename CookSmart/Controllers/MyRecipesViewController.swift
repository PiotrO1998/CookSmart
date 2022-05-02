//
//  MyRecipesViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 02/05/2022.
//

import UIKit

class MyRecipesViewController: UIViewController {
    
    var recipes: [Recipe]?
    
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getRecipes()
    
    }
    

    

    private func getRecipes() {
        
        NetworkService().getCurrentUserRecipes { recipesData in
            
            if recipesData != nil {
                
                self.recipes = recipesData!.data
            }
            
            
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

extension MyRecipesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        recipes!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyRecipeCell", for: indexPath) as! RecipeTableViewCell
        cell.recipeName.text = recipes![indexPath.row].name
        cell.recipeCookTime.text = "\(recipes![indexPath.row].cook_time)"
        cell.recipeCookTime.text = recipes![indexPath.row].level
        return cell
    }
}

extension MyRecipesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
        editIngredient = ingredients[indexPath.row]
        ingredients.remove(at: indexPath.row)
        tableView.reloadData()
        performSegue(withIdentifier: "segue-to-new-ingredient-view-controller", sender: self)
         */
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completitionHandler) in
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

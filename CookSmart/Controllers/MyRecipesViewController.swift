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

        tableView.dataSource = self
        tableView.delegate = self
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
        cell.recipeName.text = "Name: " + recipes![indexPath.row].name!
        cell.recipeCookTime.text = "Cook time: \(recipes![indexPath.row].cook_time!)"
        cell.recipeLevel.text = "Level: " + recipes![indexPath.row].level!
        return cell
    }
}

extension MyRecipesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "RecipeViewController") as! RecipeViewController
        vc.recipe = recipes![indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
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
    
    
    
    func callDeleteRecipe() {
        
        
    }
    
}

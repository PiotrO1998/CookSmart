//
//  ChoseIngredientsViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 21/04/2021.
//

import UIKit

class ChoseIngredientsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var ingredients: [String] = []
    
    
    let recipesData = RecipesData()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Testing
        //print("non veg form table view: " + String(ConfigureMealPlan.vegetarian))
        
        //ingredients = recipesData.getVegeterianIngredients() + recipesData.getNonVegeterianIngredients()
        
        
        //test
        print("vegIng: " + String(ConfigureMealPlan.vegetarian))
        print(" nonVeg :" + String(ConfigureMealPlan.nonVegetarian))
        
        print("min30: " + String(ConfigureMealPlan.min30))
        print(" h1: " + String(ConfigureMealPlan.h1))
        print("15h: " + String(ConfigureMealPlan.h15))
        
        print("minEasy: " + String(ConfigureMealPlan.easy))
        print(" minMedium; " + String(ConfigureMealPlan.medium))
        print("ha " + String(ConfigureMealPlan.hard))
        
        
        
        
        ingredients = recipesData.getIngredientsBasedOnFilters(vegIngredients: ConfigureMealPlan.vegetarian, nonVegIngredients: ConfigureMealPlan.nonVegetarian, time30: ConfigureMealPlan.min30, time1: ConfigureMealPlan.h1, time15: ConfigureMealPlan.h15, levelEasy: ConfigureMealPlan.easy, levelMedium: ConfigureMealPlan.medium, levelHard: ConfigureMealPlan.hard)
        
        //ingredients.map
        
        print(ingredients.count)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.allowsMultipleSelection = true

        // Do any additional setup after loading the view.
    }
    
    
    //TODO overwrite
    override func viewWillAppear(_ animated: Bool) {
        ingredients = recipesData.getIngredientsBasedOnFilters(vegIngredients: ConfigureMealPlan.vegetarian, nonVegIngredients: ConfigureMealPlan.nonVegetarian, time30: ConfigureMealPlan.min30, time1: ConfigureMealPlan.h1, time15: ConfigureMealPlan.h15, levelEasy: ConfigureMealPlan.easy, levelMedium: ConfigureMealPlan.medium, levelHard: ConfigureMealPlan.hard)
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

extension ChoseIngredientsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.AppNames.ingredientCellIndentifier, for: indexPath)
        cell.textLabel?.text = ingredients[indexPath.row]
        return cell
    }
    
}

extension ChoseIngredientsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
                        cell.accessoryType = .checkmark
                    }

    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
                        cell.accessoryType = .none
                    }
    }
    
    
}


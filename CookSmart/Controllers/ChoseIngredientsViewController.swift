//
//  ChoseIngredientsViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 21/04/2021.
//

import UIKit

class ChoseIngredientsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonNext: UIButton!
    
    var ingredients: [IngredientModel] = []
    
    
    let recipesData = RecipesData()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        buttonNext.backgroundColor = .clear
        buttonNext.layer.cornerRadius = 5
        buttonNext.layer.borderWidth = 1
        buttonNext.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        
        //test
        //print("vegIng: " + String(ConfigureMealPlan.vegetarian))
        //print(" nonVeg :" + String(ConfigureMealPlan.nonVegetarian))
        
        //print("min30: " + String(ConfigureMealPlan.min30))
        //print(" h1: " + String(ConfigureMealPlan.h1))
        //print("15h: " + String(ConfigureMealPlan.h15))
        
        //print("minEasy: " + String(ConfigureMealPlan.easy))
        //print(" minMedium; " + String(ConfigureMealPlan.medium))
        //print("ha " + String(ConfigureMealPlan.hard))
        
        
        
        
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
    
    @IBAction func buttonNextPressed(_ sender: UIButton) {
        
        
        
        self.performSegue(withIdentifier: Constants.AppNames.sequeToSelectedRecipesIndentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ingredietnsString = getIngredientsString()
        let recipes = recipesData.getRecipesBasedOnFilters(vegIngredients: ConfigureMealPlan.vegetarian, nonVegIngredients: ConfigureMealPlan.nonVegetarian, time30: ConfigureMealPlan.min30, time1: ConfigureMealPlan.h1, time15: ConfigureMealPlan.h15, levelEasy: ConfigureMealPlan.easy, levelMedium: ConfigureMealPlan.medium, levelHard: ConfigureMealPlan.hard)
        for i in ingredietnsString {
            print("ingredient " + i)
        }
        for i in recipes {
            print("recipe " + i.name)
        }
        
        let destinationVC = segue.destination as! SelectedMealPlansViewController
        destinationVC.ingredients = ingredietnsString
        destinationVC.recipes = recipes
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func getIngredientsString() -> [String] {
        var ingredietnsString: [String] = []
        for ingredient in ingredients {
            if ingredient.checkmark == true {
                ingredietnsString.append(ingredient.name)
            }
        }
        return ingredietnsString
    }

}

extension ChoseIngredientsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.AppNames.ingredientCellIndentifier, for: indexPath)
        cell.textLabel?.text = ingredients[indexPath.row].name
        //cell.textLabel?.textColor = UIColor(named: Constants.AppNames.colorOrange)
        return cell
    }
    
}

extension ChoseIngredientsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            ingredients[indexPath.row].checkmark = true
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
            ingredients[indexPath.row].checkmark = false
        }
    }
    
    
}


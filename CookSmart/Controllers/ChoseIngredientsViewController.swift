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
    
    var ingredientsModel: [IngredientModel] = []
    
    
    let recipesData = RecipesData()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        buttonNext.backgroundColor = .clear
        buttonNext.layer.cornerRadius = 5
        buttonNext.layer.borderWidth = 1
        buttonNext.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        //Register Table View
        //tableView.register(UINib(nibName: Constants.AppNames.ingredientCellNibName, bundle: nil), forCellReuseIdentifier: Constants.AppNames.ingredientCellIndentifier)
        
        
        //test
        //print("vegIng: " + String(ConfigureMealPlan.vegetarian))
        //print(" nonVeg :" + String(ConfigureMealPlan.nonVegetarian))
        
        //print("min30: " + String(ConfigureMealPlan.min30))
        //print(" h1: " + String(ConfigureMealPlan.h1))
        //print("15h: " + String(ConfigureMealPlan.h15))
        
        //print("minEasy: " + String(ConfigureMealPlan.easy))
        //print(" minMedium; " + String(ConfigureMealPlan.medium))
        //print("ha " + String(ConfigureMealPlan.hard))
        
        
        
        
        ingredientsModel = recipesData.getIngredientsBasedOnFilters(vegIngredients: ConfigureMealPlan.vegetarian, nonVegIngredients: ConfigureMealPlan.nonVegetarian, time30: ConfigureMealPlan.min30, time1: ConfigureMealPlan.h1, time15: ConfigureMealPlan.h15, levelEasy: ConfigureMealPlan.easy, levelMedium: ConfigureMealPlan.medium, levelHard: ConfigureMealPlan.hard)
        
        //ingredients.map
        
        print(ingredientsModel.count)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //tableView.allowsMultipleSelectionDuringEditing = true

        // Do any additional setup after loading the view.
    }
    
    
    //TODO overwrite
    override func viewWillAppear(_ animated: Bool) {
        ingredientsModel = recipesData.getIngredientsBasedOnFilters(vegIngredients: ConfigureMealPlan.vegetarian, nonVegIngredients: ConfigureMealPlan.nonVegetarian, time30: ConfigureMealPlan.min30, time1: ConfigureMealPlan.h1, time15: ConfigureMealPlan.h15, levelEasy: ConfigureMealPlan.easy, levelMedium: ConfigureMealPlan.medium, levelHard: ConfigureMealPlan.hard)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func buttonNextPressed(_ sender: UIButton) {
        var numberOfSelectedIngredients = 0
        
        for ingredientIsSelected in ingredientsModel {
            if ingredientIsSelected.isSelected {
                numberOfSelectedIngredients += 1
            }
        }
        
        if numberOfSelectedIngredients >= 3 {
        self.performSegue(withIdentifier: Constants.AppNames.sequeToSelectedRecipesIndentifier, sender: self)
        } else {
            presentAlert()
        }
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
    
   func getIngredientsString() -> [String] {
        var ingredietnsString: [String] = []
        for ingredient in ingredientsModel {
            if ingredient.isSelected == true {
                ingredietnsString.append(ingredient.name)
            }
        }
        return ingredietnsString
        }
    
    func presentAlert() {
        let alert = UIAlertController(title: "You Need To Chose At Leat Three Ingredients", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    }

extension ChoseIngredientsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ingredientsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.AppNames.ingredientCellIndentifier, for: indexPath) as! IngredientCell
        cell.ingredientName.text = ingredientsModel[indexPath.row].name
        
        cell.circle.image = ingredientsModel[indexPath.row].isSelected == true ? UIImage(named: "circle") : UIImage(named: "circleEmpty")
      
        return cell
    }
    
}


extension ChoseIngredientsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) as? IngredientCell else {return}
        
        if ingredientsModel[indexPath.row].isSelected == false {
            ingredientsModel[indexPath.row].isSelected = true
        } else {
            ingredientsModel[indexPath.row].isSelected = false
        }
        
        cell.circle.image = ingredientsModel[indexPath.row].isSelected == true ? UIImage(named: "circle") : UIImage(named: "circleEmpty")
       }
    }
  
    



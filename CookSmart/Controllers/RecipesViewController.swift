

import UIKit

/// struct represent RecipesViewController object
///
///
///  - Author: Piotr Obara
///  - Version: 1.0
///
class RecipesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let recipesData = RecipesData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //Register Table View
        tableView.register(UINib(nibName: Constants.AppNames.recipeCellNibName, bundle: nil), forCellReuseIdentifier: Constants.AppNames.recipeCellIndentifier)

        
    }
    
  

}


extension RecipesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipesData.recipes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.AppNames.recipeCellIndentifier, for: indexPath) as! RecipeCell
        cell.recipeImage.image = recipesData.recipes[indexPath.row].image
        cell.recipeName.text = recipesData.recipes[indexPath.row].name
        return cell
    }
}

//User click on sell
extension RecipesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //return clicked sell
        print(indexPath.row)
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "RecipeViewController") as! RecipeViewController
        
        vc.recipe = recipesData.recipes[indexPath.row]
        
        //vc.rImage = recipesData.recipes[indexPath.row].image
        //vc.rName = recipesData.recipes[indexPath.row].name
        //vc.rCookingTime = String(recipesData.recipes[indexPath.row].cookTime)
        //vc.rLevel = recipesData.recipes[indexPath.row].level
        //vc.rServings = String(recipesData.recipes[indexPath.row].servings)
       // vc.rIngredients = recipesData.recipes[indexPath.row].getIngredients()
        //vc.rCookingInstructions = recipesData.recipes[indexPath.row].cookingInstruction
        //vc.rType = recipesData.recipes[indexPath.row].type
        
        
        navigationController?.pushViewController(vc, animated: true)
        
        
        //let recipeViewController = RecipeViewController() as! RecipeViewController
        //recipeViewController.name = recipesData.recipes[indexPath.row].name
        //self.present(vc, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 215
    }
}

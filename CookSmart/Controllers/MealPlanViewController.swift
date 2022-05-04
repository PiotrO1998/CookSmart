//
//  MealPlansViewController.swift
//  CookSmart
//
//

import UIKit



class MealPlanViewController: UIViewController {
    
    var mealPlan: MealPlan!
    //var recipes
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
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

extension MealPlanViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        mealPlan.recipes!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyRecipeCell", for: indexPath) as! RecipeTableViewCell
        cell.recipeName.text = "Name: " + mealPlan.recipes![indexPath.row].name!
        cell.recipeCookTime.text = "Cook time: \(mealPlan.recipes![indexPath.row].cook_time!)"
        cell.recipeLevel.text = "Level: " + mealPlan.recipes![indexPath.row].level!
        return cell
    }
}

extension MealPlanViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "RecipeViewController") as! RecipeViewController
        vc.recipe = mealPlan.recipes![indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

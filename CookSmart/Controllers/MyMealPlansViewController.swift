//
//  MyMealPlansViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 23/04/2021.
//

import UIKit

class MyMealPlansViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var mealPlansData: [[String]] = []
    var mealPlans: [[Recipe]] = []
    let recipesData = RecipesData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "My Meal Plans"
        navigationItem.hidesBackButton = true
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: nil)
        
        
        if let mealPlansData = UserDefaults.standard.object(forKey: "savedMealPlans") as? [[String]] {
            mealPlans = recipesData.getRecipesByArrayOfNames(names: mealPlansData)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //Register Table View
        tableView.register(UINib(nibName: Constants.AppNames.savedMealPlanCellNibName, bundle: nil), forCellReuseIdentifier: Constants.AppNames.savedMealPlanCellIndentifier)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if let mealPlansData = UserDefaults.standard.object(forKey: "savedMealPlans") as? [[String]] {
            mealPlans = recipesData.getRecipesByArrayOfNames(names: mealPlansData)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func deleteFromDefaults(at: Int) {
        let recipeToDelete: [String] = [mealPlans[at][0].name, mealPlans[at][1].name, mealPlans[at][2].name]
        if let mealPlansData = UserDefaults.standard.object(forKey: "savedMealPlans") as? [[String]] {
        var mealsToStay: [[String]] = []
            
        if mealPlansData.contains(recipeToDelete) {
            for meal in mealPlansData {
                if meal != recipeToDelete {
                    mealsToStay.append(meal)
                }
            }
            UserDefaults.standard.set(mealsToStay, forKey: "savedMealPlans")
            let mealPlansData = UserDefaults.standard.object(forKey: "savedMealPlans") as? [[String]]
            }
        }
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




extension MyMealPlansViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealPlans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.AppNames.savedMealPlanCellIndentifier, for: indexPath) as! SavedMealPlanCell
        
        cell.imageLeft.image = mealPlans[indexPath.row][0].image
        cell.nameLeft.text = mealPlans[indexPath.row][0].name
        
        cell.imageMiddle.image = mealPlans[indexPath.row][1].image
        cell.nameMiddle.text = mealPlans[indexPath.row][1].name
        
        cell.imageRight.image = mealPlans[indexPath.row][2].image
        cell.nameRight.text = mealPlans[indexPath.row][2].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
}

extension MyMealPlansViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completitionHandler) in
            //deleteFromDefaults
            self.deleteFromDefaults(at: indexPath.row)
            self.mealPlans.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            completitionHandler(true)
        }
        
        delete.image = UIImage(systemName: "bookmark.slash")
        delete.backgroundColor = UIColor(named: Constants.AppNames.colorOrange)
        
        //swipe action
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        return swipe
        
    }
    
   
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "MealPlanViewController") as! MealPlanViewController
        vc.recipes = mealPlans[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
     }
    
    
    
    
}

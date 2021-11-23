
import UIKit

/// struct represent MyMealPlansViewController object
///
///
///  - Author: Piotr Obara
///  - Version: 1.0
///
class MyMealPlansViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var mealPlansData: [[String]] = []
    var mealPlans: [[Recipe]] = []
    let recipesData = RecipesData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "My Meal Plans"
        navigationItem.hidesBackButton = true
        
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
    
    /// function deleting array sting ffrom defaults if array is in defaults
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
}


extension MyMealPlansViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealPlans.count
    }
    
    ///Delegate method that populate table view
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
    
        
    
}

extension MyMealPlansViewController: UITableViewDelegate {
    ///delegate method that take action when table view row is swipe
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
    
    ///Delegate method that managed action when user click table view cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "MealPlanViewController") as! MealPlanViewController
        vc.recipes = mealPlans[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
     }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    
    
    
    
}

//
//  SelectedRecipesViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 22/04/2021.
//

import UIKit

class SelectedMealPlansViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var recipes: [Recipe] = []
    var ingredients: [String] = []
    var selectedMealPlans: [[Recipe]] = []
    var savedMealPlans: [[Recipe]] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //Register Table View
        tableView.register(UINib(nibName: Constants.AppNames.mealPlanCellNibName, bundle: nil), forCellReuseIdentifier: Constants.AppNames.selectedMealPlanCellIndentifier)

        var selectMealPlans: SelectMealPlans = SelectMealPlans(recipes: recipes, ingredietns: ingredients)
        selectedMealPlans = selectMealPlans.getMealPlans()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var selectMealPlans: SelectMealPlans = SelectMealPlans(recipes: recipes, ingredietns: ingredients)
        selectedMealPlans = selectMealPlans.getMealPlans()
    }
    
    @IBAction func buttonDonePressed(_ sender: UIButton) {
        
        for r in savedMealPlans {
            print("-----")
            print(r)
            print("-----")
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

extension SelectedMealPlansViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        selectedMealPlans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.AppNames.selectedMealPlanCellIndentifier, for: indexPath) as! MealPlanCell
        
        cell.imageLeft.image = selectedMealPlans[indexPath.row][0].image
        cell.nameLeft.text = selectedMealPlans[indexPath.row][0].name
        
        cell.imageMiddle.image = selectedMealPlans[indexPath.row][1].image
        cell.nameMiddle.text = selectedMealPlans[indexPath.row][1].name
        
        cell.imageRight.image = selectedMealPlans[indexPath.row][2].image
        cell.nameRight.text = selectedMealPlans[indexPath.row][2].name
        
        //cell.recipeImage.image = recipesData.recipes[indexPath.row].image
        //cell.recipeName.text = recipesData.recipes[indexPath.row].name
        
        //cell.textLabel?.text = selectedMealPlans[indexPath.row][0].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
}

extension SelectedMealPlansViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let add = UIContextualAction(style: .normal, title: "Add") { (action, view, completitionHandler) in self.savedMealPlans.append(self.selectedMealPlans[indexPath.row])
            completitionHandler(true)
        }
        
        add.image = UIImage(systemName: "bookmark.circle.fill")
        add.backgroundColor = UIColor(named: Constants.AppNames.colorOrange)
        
        //swipe action
        let swipe = UISwipeActionsConfiguration(actions: [add])
        return swipe
        
    }
    
   
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
    
}

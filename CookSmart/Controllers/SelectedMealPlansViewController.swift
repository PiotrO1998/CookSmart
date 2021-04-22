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
    var selectedMealPlans: [[Recipe]] = [[]]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //Register Table View
        //tableView.register(UINib(nibName: Constants.AppNames.recipeCellNibName, bundle: nil), forCellReuseIdentifier: Constants.AppNames.recipeCellIndentifier)

        var selectMealPlans: SelectMealPlans = SelectMealPlans(recipes: recipes, ingredietns: ingredients)
        selectedMealPlans = selectMealPlans.getMealPlans()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var selectMealPlans: SelectMealPlans = SelectMealPlans(recipes: recipes, ingredietns: ingredients)
        selectedMealPlans = selectMealPlans.getMealPlans()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.AppNames.selectedMealPlansCellIndentifier, for: indexPath)
        //cell.recipeImage.image = recipesData.recipes[indexPath.row].image
        //cell.recipeName.text = recipesData.recipes[indexPath.row].name
        
        cell.textLabel?.text = selectedMealPlans[indexPath.row][0].name
        
        return cell
    }
    
    
}

extension SelectedMealPlansViewController: UITableViewDelegate {
}

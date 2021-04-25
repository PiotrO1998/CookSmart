//
//  MealPlanViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 24/04/2021.
//

import UIKit

class MealPlanViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var recipes: [Recipe] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //Register Table View
        tableView.register(UINib(nibName: Constants.AppNames.MealCellNibName, bundle: nil), forCellReuseIdentifier: Constants.AppNames.MealCellIndentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.delegate = self
        tableView.dataSource = self
    }

    //function handle action when shoping list being pressed
    //ShopingViewController will be displayed
    @IBAction func shopingListButtonPressed(_ sender: UIButton) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "ShopingListViewController") as! ShopingListViewController
        vc.recipes = recipes
        navigationController?.pushViewController(vc, animated: true)
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
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.AppNames.MealCellIndentifier, for: indexPath) as! MealCell
        
        cell.imageMeal.image = recipes[indexPath.row].image
        cell.name.text = recipes[indexPath.row].name
        
        return cell
        
    }
    
    
    
    
}

extension MealPlanViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "RecipeViewController") as! RecipeViewController
        vc.recipe = recipes[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

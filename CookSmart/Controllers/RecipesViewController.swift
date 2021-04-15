//
//  RecipesViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 15/04/2021.
//

import UIKit

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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
    }
}

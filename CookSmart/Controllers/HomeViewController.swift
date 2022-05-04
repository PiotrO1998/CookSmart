//
//  HomeViewController.swift
//  CookSmart
//
//

import UIKit

class HomeViewController: UIViewController {
    
    var mealPlans: [MealPlan] = [MealPlan]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        setupUI()
    }
    
    private func setupUI() {
        
        NetworkService().getAllMealPlans() { mealPlans in
            
            if mealPlans != nil {
                print("Meal plan not nil")
                self.mealPlans = mealPlans!
                self.tableView.reloadData()
            }
            
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        mealPlans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let mealPlan = mealPlans[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealPlanCell", for: indexPath) as! MealPlanTableViewCell
        cell.mealPlanName.text = mealPlan.name
        cell.mealPlanDescription.text = mealPlan.description
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //NetworkService().getMealPlan(mealPlanID: String(self.mealPlans[indexPath.row].id!)) { mealPlan in
            
            //if mealPlan != nil {
            
            //self.tappedMealPlan = mealPlan
            //self.performSegue(withIdentifier: "", sender: self)
        
            //}
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "MealPlanViewController") as! MealPlanViewController
        vc.mealPlan = mealPlans[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
         
        //}
    }
    
}

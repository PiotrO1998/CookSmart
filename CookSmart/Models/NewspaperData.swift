//
//  NewspaperData.swift
//  CookSmart
//
//  Created by Piotr Obara on 24/04/2021.
//

import Foundation

struct NewspaperData {
    
    var newspapers: [Newspaper] = [ Newspaper(image: #imageLiteral(resourceName: "oragizeFridge"), title: "How to organise your fridge", body:"""
        Food Standards Agency (FSA) recommending the ideal temperature of your fridge should be between 3-5°C. Storing food correctly will also help you minimise food wastage. According to WRAP, UK households waste 7 million tonnes of it every year, 5 million of which is edible. Organising your fridge properly will help reduce waste, your chances of getting food poisoning and your weekly shopping bill.
        
        1. UPPER SHELVES:
        Foods that don’t need cooking, such as deli meats and leftovers.
        2. LOWER/MIDDLE SHELVES:
        Dairy such as milks, cheeses, yogurt and butter.
        3. BOTTOM SHELF:
        This is the coldest part of your fridge, and where wrapped raw meat and fish should be kept. Placing raw food on the bottom shelf also minimises the risk of cross-contamination.
        """, source: "https://www.goodhousekeeping.com/uk/food/a552355/organising-your-fridge-right/"),
                                       
    Newspaper(image: #imageLiteral(resourceName: "9Tips"), title: "9 Tips to Waste Less Food", body:"""
        1. Stretch ingredients over multiple meals.
        2. Adapt recipes to your needs.
        3. Make the freezer your friend.
        4. Use up fresh fruit before it goes bad.
        5. Use up fresh vegetables before they go bad.
        6. Transform leftovers into a new meal.
        7. Stretch ingredients over multiple meals.
        8. Stock your pantry.
        9. Cook with canned and frozen fruits and vegetables.
        """, source: "http://cookingmatters.org/tips/10-tips-waste-less-food"),
    
    Newspaper(image: #imageLiteral(resourceName: "reducingFoodWaste"), title: "Reducing food waste has economic, environmental and social benefits", body:"""
        Food waste occurs across the food system from the farm, post-harvest, processing, transporting, wholesaling, retailing and the consumers.
        Reducing food waste is environmentally important as it keeps food out of landfills. It makes economic sense at the small scale, by lowering household food bills and at the large scale by reducing disposal costs for restaurants, processors and farmers. Finally, reducing food waste is socially important when the rescued food is redirected to emergency food providers working to eliminate hunger in our communities.
        """
        , source: "https://www.canr.msu.edu/news/reducing_food_waste_has_economic_environmental_and_social_benefits")
    ]
    
    
}

//
//  RecipesData.swift
//  CookSmart
//
//  Created by Piotr Obara on 14/04/2021.
//

import UIKit

struct RecipesData {

let recipes: [Recipe] = [
    
    Recipe(name: "Broccoli Pasta", image: #imageLiteral(resourceName: "Broccoli Pasta"), cookTime: "Cook time: 20 min", level: Constants.Basic.levelEasy, servings: 1,
        ingredietnsImportant: [
            Ingredient(amount: 0.25, metric: "", nameOfIngredient: Constants.Ingrediant.broccoli),
            Ingredient(amount: 1, metric: "", nameOfIngredient: Constants.Ingrediant.garlicClove),
            Ingredient(amount: 15.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.parmesan),
            Ingredient(amount: 10.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.basilLeaves)],
        ingredietns: [
            Ingredient(amount: 2.0, metric: "tbsp", nameOfIngredient: Constants.Ingrediant.oliveOil),
            Ingredient(amount: 70.0, metric: "g", nameOfIngredient: Constants.Ingrediant.pasta),
            Ingredient(amount: 10.0, metric: "g", nameOfIngredient: Constants.Ingrediant.pineNuts),
            Ingredient(amount: 0.25, metric: "teaspoon", nameOfIngredient: Constants.Ingrediant.salt),
            Ingredient(amount: 0.25, metric: "teaspoon", nameOfIngredient: Constants.Ingrediant.pepper)],
       cookingInstruction:"""
       1 Tip the pasta shells into a pan of boiling, salted water. Cook according to packet instructions and drain. Steam chopped broccoli for 7 mins
       2 Once the broccoli is done, set aside a few of the smaller pieces. Squeeze the garlic from its skin, add to the blender along with the rest of the broccoli, pulse to a pesto and season well.
       3 Toss the pasta with the pesto. Add the reserved broccoli florets, split between two bowls and top with a little extra parmesan.
""", source: "own", type: "Vegetarian"),
    
    Recipe(name: "Pizza Marinara", image: #imageLiteral(resourceName: "PizzaMarinara"), cookTime: "Cook time: 1.5 h", level: Constants.Basic.levelMedium, servings: 1,
           ingredietnsImportant: [
            Ingredient(amount: 3.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.freshYeast),
            Ingredient(amount: 100.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.cannedTomatoes),
            Ingredient(amount: 1.0, metric: "", nameOfIngredient: Constants.Ingrediant.garlicClove)],
           ingredietns: [
            Ingredient(amount: 100.0, metric: Constants.Metrics.ml, nameOfIngredient: Constants.Ingrediant.water),
            Ingredient(amount: 180.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.flour),
            Ingredient(amount: 1.0, metric: Constants.Metrics.tableSpoon, nameOfIngredient: Constants.Ingrediant.oliveOil),
            Ingredient(amount: 3.0, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.salt),
            Ingredient(amount: 0.25, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.oregano)],
       cookingInstruction:"""
       1 Dissolve salt in water, then add the yeast to the water and dissolve. Immediately add a portion of the flour to the water and mix. Add the remaining flour in batches, gauging how much flour is enough. Knead for a minimum of 15-20 minutes, but ideally, 30 minutes.
       2 The dough is of ideal consistency when it's a bit sticky on the hands, and on the sides of a bowl, you're mixing it in. Shape it into a ball, then lightly coat with flour, to prevent losing moisture as it rises.
       3 Place the dough in a large bowl, then cover it with a cloth and store it in a warm place for two hours.
       4 After two hours have passed, shape the dough into balls weighing either 200 or 280 grams, depending on the size of the pizza you're making — a 22-24 cm or a 28-35 cm wide one.
       5 Once you've shaped the balls, place them all on a plate and cover them with a damp cloth and let them prove for a minimum of six hours.
       6 Once at least six hours have passed, take a ball of dough, place it on a lightly floured surface.
       7 Pressing on the ball of dough with the thumbs of your fingers, starting from the center and going towards the edges, shape into a disc, turning the dough several times in the process.
       8 As a result of this action, you should end up with a disc that has a raised rim of about 1-2 cm with a center that should be approximately 0.3 cm thick.
       9 Arrange the topping as follows; First, place the crushed, peeled tomatoes in the center of the pizza, then, with a spoon, spread them all over, except the rim, in a spiraling fashion.
       10 Next, scatter the slices of garlic evenly across the surface, followed by a sprinkling of oregano, and a drizzle of extra virgin olive oil, which should be applied in a circular motion, starting from the center outwards.
       11 Place the pizza on a pizza peel and then slide it into a wood-fired oven with a quick wrist motion, so the topping stays in place.
       12 Bake for 60-90 seconds in a wood-fired oven at a temperature of about 485°C, checking the doneness by carefully lifting the edges of the pizza.
""", source: "https://www.tasteatlas.com/pizza-napoletana/recipe", type: "Vegetarian"),
    
    Recipe(name: "Tomato Pasta", image: #imageLiteral(resourceName: "TomatoPasta"), cookTime: "Cook time: 25 min", level: Constants.Basic.levelEasy, servings: 1,
        ingredietnsImportant: [
                            Ingredient(amount: 200, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.cannedTomatoes),
                            Ingredient(amount: 1.0, metric: "", nameOfIngredient: Constants.Ingrediant.garlicClove),
                            Ingredient(amount: 5.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.basilLeaves),
                            Ingredient(amount: 10.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.parmesan)],
        ingredietns: [
                     Ingredient(amount: 2.0, metric: "tbsp", nameOfIngredient: Constants.Ingrediant.oliveOil),
                     Ingredient(amount: 70.0, metric: "g", nameOfIngredient: Constants.Ingrediant.pasta),
                     Ingredient(amount: 0.25, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.salt),
                     Ingredient(amount: 0.25, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.pepper),
                     Ingredient(amount: 0.25, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.oregano)],
       cookingInstruction:"""
       1 Bring a pot of salted water to a boil. Add the pasta and cook al dente, about 10 minutes or according to package instructions.
       2 Thinly slice garlic and add it to warm a pan with oil.
       3 After few second add Chopped Basil
       4 When garlic will get slightly brown colour add tomatoes
       5 Add salt, pepper, oregano
       6 Mix al dente pasta with the source
       7 Drain the pasta and add it to the sauce. Toss gently to combine. toss once more
""", source: "own", type: "Vegetarian"),
]

    
}

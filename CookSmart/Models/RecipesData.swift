//
//  RecipesData.swift
//  CookSmart
//
//  Created by Piotr Obara 
//

import UIKit

struct RecipesData {

var recipes: [Recipe] = [
    Recipe(name: "Risotto", image: #imageLiteral(resourceName: "Risotto"), cookTime: 40, level: Constants.Basic.levelEasy, servings: 1,
            ingredietnsImportant: [
                Ingredient(amount: 230, metric: Constants.Metrics.ml, nameOfIngredient: Constants.Ingrediant.chickenBroth),
                Ingredient(amount: 0.25, metric: "", nameOfIngredient: Constants.Ingrediant.onion),
                Ingredient(amount: 30.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.parmesan),
                Ingredient(amount: 10.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.parsley)],
            ingredietns: [
                Ingredient(amount: 50, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.rice),
                Ingredient(amount: 0.5, metric: Constants.Metrics.tableSpoon, nameOfIngredient: Constants.Ingrediant.butter),
                Ingredient(amount: 0.5, metric: Constants.Metrics.tableSpoon, nameOfIngredient: Constants.Ingrediant.oil),
                Ingredient(amount: 100, metric: Constants.Metrics.ml, nameOfIngredient: Constants.Ingrediant.drywhiteWine),
                Ingredient(amount: 0.10, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.salt)],
           cookingInstruction:"""
           1 Gather the ingredients.
           2 In a medium saucepan, heat the stock to a simmer. Lower the heat so the stock stays hot while you cook the risotto.
           3 In a large, heavy-bottomed saucepan, heat the oil and 1 tablespoon of the butter over medium heat. When the butter has melted, add the chopped shallot or onion. Sauté for 2 to 3 minutes or until slightly translucent.
           4 Add the rice to the pot and stir it briskly with a wooden spoon so that the grains are coated with the oil and melted butter. Sauté for another minute or so, until there is a slightly nutty aroma. But don't let the rice turn brown.
           5 Add the vermouth or wine and cook while stirring, until the liquid is fully absorbed.
           6 Add a ladle of hot chicken stock to the rice and stir until the liquid is fully absorbed. When the rice appears almost dry, add another ladle of stock and repeat the process.
           7 Continue adding stock, a ladle at a time, for 20 to 30 minutes or until the grains are tender but still firm to the bite, without being crunchy (al dente).
           8 Stir in the remaining 2 tablespoons of butter and the Parmesan cheese and parsley. Season to taste with salt.
           9 Serve in bowls and enjoy.
    """, source: "own", type: Constants.Basic.nonVegetarian),
    
    Recipe(name: "Pizza Marinara", image: #imageLiteral(resourceName: "PizzaMarinara"), cookTime: 180, level: Constants.Basic.levelMedium, servings: 1,
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
""", source: "https://www.tasteatlas.com/pizza-napoletana/recipe", type: Constants.Basic.vegetarian),
    
    Recipe(name: "Tomato Pasta", image: #imageLiteral(resourceName: "TomatoPasta"), cookTime: 25, level: Constants.Basic.levelEasy, servings: 1,
        ingredietnsImportant: [
                            Ingredient(amount: 200, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.cannedTomatoes),
                            Ingredient(amount: 1.0, metric: "", nameOfIngredient: Constants.Ingrediant.garlicClove),
                            Ingredient(amount: 5.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.basilLeaves),
                            Ingredient(amount: 10.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.parmesan)],
        ingredietns: [
                     Ingredient(amount: 2.0, metric: Constants.Metrics.tableSpoon, nameOfIngredient: Constants.Ingrediant.oliveOil),
                     Ingredient(amount: 70.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.pasta),
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
""", source: "own", type: Constants.Basic.vegetarian),
    
    Recipe(name: "Broccoli Pasta", image: #imageLiteral(resourceName: "Broccoli Pasta"), cookTime: 20, level: Constants.Basic.levelEasy, servings: 1,
        ingredietnsImportant: [
            Ingredient(amount: 0.25, metric: "", nameOfIngredient: Constants.Ingrediant.broccoli),
            Ingredient(amount: 1.0, metric: "", nameOfIngredient: Constants.Ingrediant.garlicClove),
            Ingredient(amount: 15.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.parmesan),
            Ingredient(amount: 10.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.basilLeaves)],
        ingredietns: [
            Ingredient(amount: 2.0, metric: Constants.Metrics.tableSpoon, nameOfIngredient: Constants.Ingrediant.oliveOil),
            Ingredient(amount: 70.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.pasta),
            Ingredient(amount: 10.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.pineNuts),
            Ingredient(amount: 0.25, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.salt),
            Ingredient(amount: 0.25, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.pepper)],
       cookingInstruction:"""
       1 Tip the pasta shells into a pan of boiling, salted water. Cook according to packet instructions and drain. Steam chopped broccoli for 7 mins
       2 Once the broccoli is done, set aside a few of the smaller pieces. Squeeze the garlic from its skin, add to the blender along with the rest of the broccoli, pulse to a pesto and season well.
       3 Toss the pasta with the pesto. Add the reserved broccoli florets, split between two bowls and top with a little extra parmesan.
""", source: "own", type: Constants.Basic.vegetarian),
    
    Recipe(name: "Curry chicken salad", image: #imageLiteral(resourceName: "Curry chicken salad"), cookTime: 15, level: Constants.Basic.levelEasy, servings: 1,
            ingredietnsImportant: [
                Ingredient(amount: 0.125, metric: "", nameOfIngredient: Constants.Ingrediant.lemon),
                Ingredient(amount: 1.0, metric: "", nameOfIngredient: Constants.Ingrediant.chickenBreast),
                Ingredient(amount: 0.125, metric: "", nameOfIngredient: Constants.Ingrediant.apple),
                Ingredient(amount: 0.125, metric: "", nameOfIngredient: Constants.Ingrediant.celeryRib),
                Ingredient(amount: 0.5, metric: "", nameOfIngredient: Constants.Ingrediant.onion),
                Ingredient(amount: 1, metric: Constants.Metrics.tableSpoon, nameOfIngredient: Constants.Ingrediant.cilantro)],
            ingredietns: [
                Ingredient(amount: 32.5, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.mayonnaise),
                Ingredient(amount: 0.375, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.curryPowder),
                Ingredient(amount: 0.1, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.salt),
                Ingredient(amount: 8.5, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.raisins),
                Ingredient(amount: 8.5, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.roastedCashews)],
           cookingInstruction:"""
           1 In a medium bowl mix together the mayonnaise, curry powder, lime juice, and salt.
           2 Next add the cooked chicken, diced apple, celery, and onions and stir until well combined.
           3 Fold in the raisins, cashews, and cilantro.
           4 Serve in a lettuce wrap, on a bed of greens or in a tortilla wrap or between slices of your favorite bread.
    """, source: "own", type: Constants.Basic.nonVegetarian),
    
    Recipe(name: "Tuna Pasta", image: #imageLiteral(resourceName: "Tuna Pasta"), cookTime: 15, level: Constants.Basic.levelEasy, servings: 1,
            ingredietnsImportant: [
                Ingredient(amount: 1, metric: "", nameOfIngredient: Constants.Ingrediant.garlicClove),
                Ingredient(amount: 1, metric: "", nameOfIngredient: Constants.Ingrediant.cannedTuna),
                Ingredient(amount: 0.5, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.lemon),
                Ingredient(amount: 10.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.parsley)],
            ingredietns: [
                Ingredient(amount: 1, metric: Constants.Metrics.tableSpoon, nameOfIngredient: Constants.Ingrediant.oliveOil),
                Ingredient(amount: 0.125, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.salt),
                Ingredient(amount: 0.125, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.pepper),
                Ingredient(amount: 60.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.pasta)],
           cookingInstruction:"""
           1 Boil a salted pot of water for your pasta and cook it al dente according to package directions. Prep your other ingredients while it cooks.
           2 When the pasta is close to being ready, add the oil to a small pan over medium heat. Once the oil is hot, add the garlic and cook it for 30 seconds.
           3 Stir in the tuna, lemon juice, and parsley. Let it heat through.
           4 Once the pasta is done, add some of the pasta water (a couple tablespoons) to the sauce and then drain the pasta and toss with the sauce. Season with salt & pepper as needed. Optional: serve pasta with freshly grated parmesan cheese and lemon zest.
    """, source: "own", type: Constants.Basic.nonVegetarian),

    Recipe(name: "Salmon salad", image: #imageLiteral(resourceName: "Salmon salad"), cookTime: 40, level: Constants.Basic.levelEasy, servings: 1,
            ingredietnsImportant: [
                Ingredient(amount: 225.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.salmon),
                Ingredient(amount: 12.5, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.scallions),
                Ingredient(amount: 12.5, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.dill),
                Ingredient(amount: 12.5, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.celery),
                Ingredient(amount: 10.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.parsley),
                Ingredient(amount: 0.5, metric: Constants.Metrics.tableSpoon, nameOfIngredient: Constants.Ingrediant.lemon)
                ],
            ingredietns: [
                Ingredient(amount: 0.0625, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.smokedPapricaPowder),
                Ingredient(amount: 0.0625, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.chiliPowder),
                Ingredient(amount: 0.0625, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.salt),
                Ingredient(amount: 0.0625, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.pepper),
                Ingredient(amount: 7.5, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.mayonnaise),
                Ingredient(amount: 0.5, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.mustard)
                ],
           cookingInstruction:"""
           1 Start by cooking the salmon using your preferred method. Much of the time I use my method from Baked Salmon, baking in a 425F oven for 12-15 minutes, but you can also cook in a skillet over medium high heat, which takes about 5-10 minutes depending on the thickness of your salmon. You may also grill it, poach it, etc. When the salmon is cooked through to 140 degrees F, flake the salmon with a fork (and discard any skin).
           2 In a big bowl, combine the rest of the ingredients and mix well.
           3 Add the salmon to the dressing, and toss. Taste and check for seasoning.
           4 It is now ready to be enjoyed warm, or you can pop it into the fridge until fully chilled. Enjoy!
    """, source: "own", type: Constants.Basic.nonVegetarian),
    
    Recipe(name: "Chicken tortilla", image: #imageLiteral(resourceName: "Chicken tortilla"), cookTime: 35, level: Constants.Basic.levelEasy, servings: 1,
            ingredietnsImportant: [
                Ingredient(amount: 1.0, metric: "", nameOfIngredient: Constants.Ingrediant.chickenBreast),
                Ingredient(amount: 2.0, metric: "", nameOfIngredient: Constants.Ingrediant.tortillaWraps),
                Ingredient(amount: 0.25, metric: "", nameOfIngredient: Constants.Ingrediant.cream),
                Ingredient(amount: 100.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.cannedBlackBeans),
                Ingredient(amount: 0.25, metric: "", nameOfIngredient: Constants.Ingrediant.onion),
                Ingredient(amount: 0.5, metric: "", nameOfIngredient: Constants.Ingrediant.zucchini),
                Ingredient(amount: 0.5, metric: "", nameOfIngredient: Constants.Ingrediant.bellPepper),
                Ingredient(amount: 0.5, metric: "", nameOfIngredient: Constants.Ingrediant.mushrooms)],
            ingredietns: [
                Ingredient(amount: 0.25, metric: Constants.Metrics.tableSpoon, nameOfIngredient: Constants.Ingrediant.sugar),
                Ingredient(amount: 75.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.tacoSauce),
                Ingredient(amount: 0.25, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.oliveOil)],
    cookingInstruction: """
           1 Combine the chicken and taco sauce in a medium bowl. Cover with plastic wrap and place in the fridge for 5-10 minutes to marinate.
           2 Heat the oil in a large frying pan over medium heat. Add the onion and zucchini and cook, stirring, for 5 minutes or until the onion begins to brown. Add the capsicum, mushroom and sugar. Cook, stirring, for 5 minutes or until the sugar dissolves and begins to caramelise.
           3 Meanwhile, heat a large non-stick frying pan over high heat. Add the chicken mixture and cook, stirring occasionally, for 10 minutes or until cooked through.
           4 Place the refried beans in a small saucepan over low heat and cook, stirring, for 5 minutes or until heated through.
           5 Top the tortilla wraps with the onion mixture and the chicken mixture. Serve with sour cream and refried beans.
    """, source: "own", type: Constants.Basic.nonVegetarian),
    
    Recipe(name: "Burrito", image:  #imageLiteral(resourceName: "Burrito"), cookTime: 30, level: Constants.Basic.levelEasy, servings: 1,
            ingredietnsImportant: [
                Ingredient(amount: 80.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.beefGround),
                Ingredient(amount: 100.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.cannedBlackBeans),
                Ingredient(amount: 1.0, metric: "", nameOfIngredient: Constants.Ingrediant.tortillaWraps),
                Ingredient(amount: 21.5, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.chees),
                Ingredient(amount: 0.2, metric: "", nameOfIngredient: Constants.Ingrediant.cream),
                Ingredient(amount: 0.2, metric: "", nameOfIngredient: Constants.Ingrediant.salsa)
                ],
            ingredietns: [
                Ingredient(amount: 1.0, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.tacoSeasoning),
                Ingredient(amount: 0.5, metric: Constants.Metrics.tableSpoon, nameOfIngredient: Constants.Ingrediant.oil)],
           cookingInstruction:"""
           1 In a large cast-iron or other heavy skillet, cook beef over medium heat until no longer pink; drain. Stir in taco seasoning; remove from skillet and set aside. Wipe skillet clean.
           2 In a small saucepan, cook refried beans over medium-low heat until heated through, 2-3 minutes.
           3 Spoon about 1/3 cup of beans off-center on each tortilla; top with 1/4 cup beef mixture. Sprinkle with cheese. Fold sides and ends of tortillas over filling and roll up.
           4 In same skillet over medium-high heat, brown burritos in oil on all sides. Serve with sour cream and salsa.
    Freeze option: Individually wrap cooled burritos in paper towels and foil; freeze in a freezer container. To use, remove foil; place paper towel-wrapped burrito on a microwave-safe plate. Microwave on high until heated through, turning once, 3-4 minutes. Let stand 20 seconds.
    """, source: "own", type: Constants.Basic.nonVegetarian),
    
    Recipe(name: "Fish and chips ", image:  #imageLiteral(resourceName: "Fish and chips "), cookTime: 55, level: Constants.Basic.levelEasy, servings: 1,
            ingredietnsImportant: [
                Ingredient(amount: 225.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.potatoes),
                Ingredient(amount: 56.25, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.whiteFishFillets),
                Ingredient(amount: 0.125, metric: "", nameOfIngredient: Constants.Ingrediant.lemon),
                Ingredient(amount: 31.25, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.poddedPeas)
                ],
            ingredietns: [
                Ingredient(amount: 0.25, metric: "", nameOfIngredient: Constants.Ingrediant.oil),
                Ingredient(amount: 71.25, metric: Constants.Metrics.ml, nameOfIngredient: Constants.Ingrediant.beer),
                Ingredient(amount: 0.75, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.bakingPowder),
                Ingredient(amount: 1.25, metric: Constants.Metrics.tableSpoon, nameOfIngredient: Constants.Ingrediant.butter),
                Ingredient(amount: 56.25, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.flour)],
           cookingInstruction:"""
           1 Preheat the oven to 180°C/350°F/gas 4.
           2 Peel and slice the potatoes into chips.
           3 To make the mushy peas, pick and finely chop the mint leaves. Place the butter in a pan over a medium-low heat, add the peas and mint, pop the lid on and simmer gently for 10 minutes.
           4 Add a squeeze of lemon juice and season to taste with sea salt and black pepper – you can either mush the peas up in a food processor, or mash them by hand until stodgy, thick and perfect for dipping your fish into. Keep them warm until needed.
           5 Pour the sunflower oil into a deep fat fryer or a large sturdy pan and heat it to 190°C/375°F.
           6 Mix ½ a teaspoon of salt and 1 teaspoon of pepper together, then use it to season the fish fillets on both sides – this will help to remove any excess water, making the fish really meaty.
           7 Whisk the flour, beer and baking powder together until nice and shiny – the texture should be like semi-whipped double cream (i.e. it should stick to whatever you're coating).
           8 Dust each fish fillet in a little of the extra flour, then dip into the batter and allow any excess to drip off. Holding one end, gently lower the fish into the oil one by one, working carefully so you don't get splashed – it will depend on the size of your fryer or pan how many fish you can cook at once.
           9 Cook for 4 minutes, or until the fish is cooked through and the batter is golden and crisp, then remove to kitchen paper to drain.
           10 Meanwhile, parboil the chips in boiling salted water for 4 to 5 minutes, or until softened but still retaining their shape, then drain and steam dry.
           11 When the chips are nice and dry, fry in the oil that the fish were cooked in at 180°C/350°F until golden and crisp.
           12 While the chips are frying, transfer the fish from the kitchen paper to a baking tray. Place in the oven for a few minutes to finish cooking – this way they will stay crisp while you finish off the chips.
           13 When the chips are done, drain them on kitchen paper, season with salt, and serve with the fish and mushy peas. Other things to have on the table are some crunchy sweet pickled gherkins, some pickled onions (if your other half isn't around!) – and pickled chillies are good, too. Then you want to douse it all with some cheap malt vinegar and nothing other than Heinz tomato ketchup.

    """, source: "own", type: Constants.Basic.nonVegetarian),
    
    Recipe(name: "Korean Chicken", image:  #imageLiteral(resourceName: "Korean Chicken"), cookTime: 25, level: Constants.Basic.levelEasy, servings: 1,
            ingredietnsImportant: [
                Ingredient(amount: 125.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.chickenThings),
                Ingredient(amount: 0.25, metric: Constants.Metrics.tableSpoon, nameOfIngredient: Constants.Ingrediant.ginger),
                Ingredient(amount: 0.25, metric: "", nameOfIngredient: Constants.Ingrediant.garlicClove)
                ],
            ingredietns: [
                Ingredient(amount: 0.25, metric: Constants.Metrics.tableSpoon, nameOfIngredient: Constants.Ingrediant.oil),
                Ingredient(amount: 0.25, metric: Constants.Metrics.tableSpoon, nameOfIngredient: Constants.Ingrediant.sesameOil),
                Ingredient(amount: 0.25, metric: Constants.Metrics.tableSpoon, nameOfIngredient: Constants.Ingrediant.soySouce),
                Ingredient(amount: 0.375, metric: Constants.Metrics.tableSpoon, nameOfIngredient: Constants.Ingrediant.sugar)
                ],
           cookingInstruction:"""
           1 Slice the chicken thighs horizontally to make thinner pieces of meat. Slice each piece of chicken thigh (depends on its thickness) into 2 or 3 horizontal pieces. Set aside.
           2 Combine all the ingredients in the Marinade in a bowl, whisk it to make sure the Korean chili paste (gochujang) is completely dissolved. Marinate the chicken for at least 30 minutes or best for two hours.
           3 Grill the chicken until slightly charred and completely cooked through. You may also pan-fried the chicken on a skillet or pan, or bake in the oven at 400°F (207°C) for about 20 minutes. Serve immediately with steamed rice.

    """, source: "own", type: Constants.Basic.nonVegetarian),
    
    Recipe(name: "jambalaya", image:  #imageLiteral(resourceName: "jambalaya"), cookTime: 60, level: Constants.Basic.levelEasy, servings: 1,
            ingredietnsImportant: [
                Ingredient(amount: 30.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.chorizoSousage),
                Ingredient(amount: 1.0, metric: "", nameOfIngredient: Constants.Ingrediant.chickenBreast),
                Ingredient(amount: 100.0, metric: Constants.Metrics.ml, nameOfIngredient: Constants.Ingrediant.chickenBroth),
                Ingredient(amount: 10.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.parsley),
                Ingredient(amount: 100.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.cannedTomatoes),
                Ingredient(amount: 1.0, metric: "", nameOfIngredient: Constants.Ingrediant.bellPepper),
                Ingredient(amount: 1.0, metric: "", nameOfIngredient: Constants.Ingrediant.onion),
                Ingredient(amount: 1.0, metric: Constants.Metrics.tableSpoon, nameOfIngredient: Constants.Ingrediant.tomatoPaste)
                ],
            ingredietns: [
                Ingredient(amount: 30.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.rice),
                Ingredient(amount: 0.25, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.salt),
                Ingredient(amount: 0.25, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.pepper),
                Ingredient(amount: 0.25, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.turmeric),
                Ingredient(amount: 1.0, metric: Constants.Metrics.tableSpoon, nameOfIngredient: Constants.Ingrediant.smokedPapricaPowder),
                Ingredient(amount: 1.0, metric: Constants.Metrics.tableSpoon, nameOfIngredient: Constants.Ingrediant.cumin)],
           cookingInstruction:"""
           1 Slice the sausage, chicken breast, pepper, onion into slices and tomato.
           2 Add paprika and onion to the hot fat, fry for 5 minutes.
           3 Add chorizo and chicken seasoned with salt and pepper.
           4 Fry for 3-4 minutes. Then add a handful of raw rice and spices, as well as the tomato.
           5 Mix everything together and add the broth - cook, covered, 15-20 minutes. stirring occasionally.
           6 After cooking, season with salt and pepper and sprinkle with parsley, add a tablespoon of tomato paste.

    """, source: "own", type: Constants.Basic.nonVegetarian),
    
    Recipe(name: "Meatballs Pasta", image:  #imageLiteral(resourceName: "Meatballs Pasta"), cookTime: 60, level: Constants.Basic.levelEasy, servings: 1,
            ingredietnsImportant: [
            Ingredient(amount: 125.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.beefGround),
            Ingredient(amount: 10.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.parsley),
            Ingredient(amount: 10.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.parmesan),
                Ingredient(amount: 200.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.cannedTomatoes),
                Ingredient(amount: 0.25, metric: "", nameOfIngredient: Constants.Ingrediant.egg),
            Ingredient(amount: 0.5, metric: "", nameOfIngredient: Constants.Ingrediant.garlicClove),
            Ingredient(amount: 0.125, metric: "", nameOfIngredient: Constants.Ingrediant.onion)
                ],
            ingredietns: [
                Ingredient(amount: 125.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.pasta),
                Ingredient(amount: 10.0, metric: Constants.Metrics.gram, nameOfIngredient: Constants.Ingrediant.breadCrumbs),
                Ingredient(amount: 0.0625, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.salt),
                Ingredient(amount: 0.0625, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.redPepperFlakes),
                Ingredient(amount: 0.5, metric: Constants.Metrics.tableSpoon, nameOfIngredient: Constants.Ingrediant.oliveOil),
                
                Ingredient(amount: 0.0625, metric: Constants.Metrics.teaspoon, nameOfIngredient: Constants.Ingrediant.pepper)],
           cookingInstruction:"""
           1 In a large pot of boiling salted water, cook spaghetti according to package instructions. Drain.
           2 In a large bowl, combine beef with bread crumbs, parsley, Parmesan, egg, garlic, 1 teaspoon salt, and red pepper flakes. Mix until just combined then form into 16 balls.
           3 In a large pot over medium heat, heat oil. Add meatballs and cook, turning occasionally, until browned on all sides, about 10 minutes. Transfer meatballs to a plate.
           4 Add onion to pot and cook until soft, 5 minutes. Add crushed tomatoes and bay leaf. Season with salt and pepper and bring to a simmer. Return meatballs to pot and cover. Simmer until sauce has thickened, 8 to 10 minutes.
           5 Serve pasta with a healthy scoop of meatballs and sauce. Top with Parmesan before serving.

    """, source: "own", type: Constants.Basic.nonVegetarian),
    
    
]
    
    func getVegeterianIngredients() -> [String] {
        var vegeterianIngredients: [String] = []
        
        for recipe in recipes {
            if recipe.type == "Vegetarian" {
                for ingredientInRecipe in recipe.getIngredientsArray() {
                    if !vegeterianIngredients.contains(ingredientInRecipe) {
                        vegeterianIngredients.append(ingredientInRecipe)
                    }
                }
            }
        }
        return vegeterianIngredients
    }
    
    func getNonVegeterianIngredients() -> [String] {
        var nonVegeterianIngredients: [String] = []
        
        for recipe in recipes {
            if recipe.type == "Non Vegetarian" {
                for ingredientInRecipe in recipe.getIngredientsArray() {
                    if !nonVegeterianIngredients.contains(ingredientInRecipe) {
                        nonVegeterianIngredients.append(ingredientInRecipe)
                    }
                }
            }
        }
        return nonVegeterianIngredients
    }
    
    func getVegRecipe() -> [Recipe] {
        var vegRecipes: [Recipe] = []
        for recipe in recipes {
            if recipe.type == "Vegetarian" {
                vegRecipes.append(recipe)
                }
            }
        return vegRecipes
        }
    
    func getNonVegRecipe() -> [Recipe] {
        var nonVegRecipes: [Recipe] = []
        for recipe in recipes {
            if recipe.type == "Non Vegetarian" {
                nonVegRecipes.append(recipe)
                }
            }
        return nonVegRecipes
        }
    
    func getRecipes30Filter(recipesToFilter: [Recipe]) -> [Recipe] {
        var recipes30: [Recipe] = []
        for r in recipesToFilter {
            if r.cookTime <= 30 {
                recipes30.append(r)
            }
        }
        return recipes30
    }
    
    func getRecipes1Filter(recipesToFilter: [Recipe]) -> [Recipe] {
        var recipes1: [Recipe] = []
        for r in recipesToFilter {
            if r.cookTime <= 60 {
                recipes1.append(r)
            }
        }
        return recipes1
    }
    
    func getRecipes15Filter(recipesToFilter: [Recipe]) -> [Recipe] {
        var recipes15: [Recipe] = []
        for r in recipesToFilter {
            if r.cookTime <= 180 {
                recipes15.append(r)
            }
        }
        return recipes15
    }
    
    func getRecipeLevelEasyFilter(recipesToFilter: [Recipe]) -> [Recipe] {
        var recipesEasy: [Recipe] = []
        for r in recipesToFilter {
            if r.level == Constants.Basic.levelEasy {
                recipesEasy.append(r)
            }
        }
        return recipesEasy
    }
    
    //level Medium adds medium and easy
    func getRecipeLevelMediumFilter(recipesToFilter: [Recipe]) -> [Recipe] {
        var recipesMedium: [Recipe] = []
        for r in recipesToFilter {
            if r.level == Constants.Basic.levelMedium ||  r.level == Constants.Basic.levelEasy {
                recipesMedium.append(r)
            }
        }
        return recipesMedium
    }
    
    
    //level hard add hard, medium and easy
    func getRecipeLevelHardFilter(recipesToFilter: [Recipe]) -> [Recipe] {
        var recipesHard: [Recipe] = []
        for r in recipesToFilter {
            if r.level == Constants.Basic.levelHard || r.level == Constants.Basic.levelMedium ||  r.level == Constants.Basic.levelEasy {
                recipesHard.append(r)
            }
        }
        return recipesHard
    }
    
    func getIngredientsString(recipesToIngredientsString: [Recipe]) -> [String] {
        var ingrediensString: [String] = []
        for r in recipesToIngredientsString {
            for ingredientInRecipe in r.getIngredientsImportantArray() {
                if !ingrediensString.contains(ingredientInRecipe) {
                    ingrediensString.append(ingredientInRecipe)
                }
            }
        }
        return ingrediensString
    }
    
    //function return array of IngredientRecipe that is used in ingredients selection
    //array is created from user selected options
    func getIngredientsBasedOnFilters(vegIngredients: Bool, nonVegIngredients: Bool, time30: Bool, time1: Bool, time15: Bool, levelEasy: Bool, levelMedium: Bool, levelHard: Bool) -> [IngredientModel] {
        
        var recipes: [Recipe] = []
        var ingredientsBasedOnFilters: [String] = []
        var ingredientsModelBasedOnFilters: [IngredientModel] = []
        
        if vegIngredients {
            recipes += getVegRecipe()
        }
        
        if nonVegIngredients {
            recipes += getNonVegRecipe()
        }
        
        if time15 {
            recipes = getRecipes15Filter(recipesToFilter: recipes)
        } else if time1 {
            recipes = getRecipes1Filter(recipesToFilter: recipes)
        } else if time30 {
            recipes = getRecipes30Filter(recipesToFilter: recipes)
        }
        
        if levelHard {
            recipes = getRecipeLevelHardFilter(recipesToFilter: recipes)
        } else if levelMedium {
            recipes = getRecipeLevelMediumFilter(recipesToFilter: recipes)
        } else if levelEasy {
            recipes = getRecipeLevelEasyFilter(recipesToFilter: recipes)
        }
        
        
        ingredientsBasedOnFilters = getIngredientsString(recipesToIngredientsString: recipes)
        ingredientsModelBasedOnFilters = getIngredientsModel(ingredients: ingredientsBasedOnFilters)
        
        return ingredientsModelBasedOnFilters
    }
    
    //function return selected recipes based on user filters
    func getIngredientsModel(ingredients: [String]) -> [IngredientModel] {
        var ingredientsModel: [IngredientModel] = []
        for ingredient in ingredients {
            let ingredientModel = IngredientModel(name: ingredient, isSelected: false)
            ingredientsModel.append(ingredientModel)
        }
        return ingredientsModel
    }
    
    func getRecipesBasedOnFilters(vegIngredients: Bool, nonVegIngredients: Bool, time30: Bool, time1: Bool, time15: Bool, levelEasy: Bool, levelMedium: Bool, levelHard: Bool) -> [Recipe] {
        
        var recipes: [Recipe] = []
        
        if vegIngredients {
            recipes += getVegRecipe()
        }
        
        if nonVegIngredients {
            recipes += getNonVegRecipe()
        }
        
        if time15 {
            recipes = getRecipes15Filter(recipesToFilter: recipes)
        } else if time1 {
            recipes = getRecipes1Filter(recipesToFilter: recipes)
        } else if time30 {
            recipes = getRecipes30Filter(recipesToFilter: recipes)
        }
        
        if levelHard {
            recipes = getRecipeLevelHardFilter(recipesToFilter: recipes)
        } else if levelMedium {
            recipes = getRecipeLevelMediumFilter(recipesToFilter: recipes)
        } else if levelEasy {
            recipes = getRecipeLevelEasyFilter(recipesToFilter: recipes)
        }
        
         return recipes
    }

    func getRecipesByArrayOfNames(names: [[String]]) -> [[Recipe]] {
        var recipesToReturn: [[Recipe]] = []
        
        for name in names {
            recipesToReturn.append([getRecipeByName(name: name[0]), getRecipeByName(name: name[1]), getRecipeByName(name: name[2])])
        }
        return recipesToReturn
    }
    
    func getRecipeByName(name: String) -> Recipe {
        var recipeToReturn: Recipe?
        for recipe in recipes {
            if recipe.name == name {
                recipeToReturn = recipe
            }
        }
        return recipeToReturn!
    }
    
}

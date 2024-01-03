import SwiftUI

struct MealDetailView: View {
    let meal: Meal

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(meal.strMeal)
                    .font(.title)

                Text("Instructions:")
                    .font(.headline)
                Text(meal.strInstructions ?? "No instructions available.")
                    .padding(.bottom, 16)

                Text("Ingredients:")
                    .font(.headline)
                

                Text(meal.strIngredient1 ?? "")
                    .padding(.bottom, 8)

                Text(meal.strIngredient2 ?? "")
                    .padding(.bottom, 8)

                Text(meal.strIngredient3 ?? "")
                    .padding(.bottom, 8)

                Text(meal.strIngredient4 ?? "")
                    .padding(.bottom, 8)

                Text(meal.strIngredient5 ?? "")
                    .padding(.bottom, 8)

                Text(meal.strIngredient6 ?? "")
                    .padding(.bottom, 8)

                Text(meal.strIngredient7 ?? "")
                    .padding(.bottom, 8)

                Text(meal.strIngredient8 ?? "")
                    .padding(.bottom, 8)

                Text(meal.strIngredient9 ?? "")
                    .padding(.bottom, 8)

                Text(meal.strIngredient10 ?? "")
                    .padding(.bottom, 8)

                Text(meal.strIngredient11 ?? "")
                    .padding(.bottom, 8)

                Text(meal.strIngredient12 ?? "")
                    .padding(.bottom, 8)

                Text(meal.strIngredient13 ?? "")
                    .padding(.bottom, 8)

                Text(meal.strIngredient14 ?? "")
                    .padding(.bottom, 8)

                Text(meal.strIngredient15 ?? "")
                    .padding(.bottom, 8)

                Text(meal.strIngredient16 ?? "")
                    .padding(.bottom, 8)

                Text(meal.strIngredient17 ?? "")
                    .padding(.bottom, 8)

                Text(meal.strIngredient18 ?? "")
                    .padding(.bottom, 8)

                Text(meal.strIngredient19 ?? "")
                    .padding(.bottom, 8)

                Text(meal.strIngredient20 ?? "")
                    .padding(.bottom, 8)

            }
            .padding()
        }
        .navigationTitle("Meal Detail")
    }
}



struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(meal: Meal(idMeal: "123", strMeal: "Example Meal", strInstructions: "Instructions", strIngredient1: "Ingredient1",
                                  strIngredient2: "Ingredient2",
                                  strIngredient3: "Ingredient3",
                                  strIngredient4: "Ingredient4",
                                  strIngredient5: "Ingredient5",
                                  strIngredient6: "Ingredient6",
                                  strIngredient7: "Ingredient7",
                                  strIngredient8: "Ingredient8",
                                  strIngredient9: "Ingredient9",
                                  strIngredient10: "Ingredient10",
                                  strIngredient11: "Ingredient11",
                                  strIngredient12: "Ingredient12",
                                  strIngredient13: "Ingredient13",
                                  strIngredient14: "Ingredient14",
                                  strIngredient15: "Ingredient15",
                                  strIngredient16: "Ingredient16",
                                  strIngredient17: "Ingredient17",
                                  strIngredient18: "Ingredient18",
                                  strIngredient19: "Ingredient19",
                                  strIngredient20: "Ingredient20"
))
    }
}



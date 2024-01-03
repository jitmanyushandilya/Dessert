import Foundation

class MealService {
    func fetchDessertMeals(completion: @escaping ([Meal]?) -> Void) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                completion(nil)
                return
            }

            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }

            do {
                // You can print the response if you want to see more details
                if let httpResponse = response as? HTTPURLResponse {
                    print("HTTP Status Code: \(httpResponse.statusCode)")
                }

                let meals = try JSONDecoder().decode(MealsResponse.self, from: data)
                // Print the received data
                print("Received data: \(data)")

                // Set strInstructions and strIngredient to empty string if they are nil
                let mealsWithDefaults = meals.meals.map { meal in
                    var mealWithDefaults = meal
                    mealWithDefaults.strInstructions = mealWithDefaults.strInstructions ?? ""
                    mealWithDefaults.strIngredient1 = mealWithDefaults.strIngredient1 ?? ""
                    mealWithDefaults.strIngredient2 = mealWithDefaults.strIngredient2 ?? ""
                    mealWithDefaults.strIngredient3 = mealWithDefaults.strIngredient3 ?? ""
                    mealWithDefaults.strIngredient4 = mealWithDefaults.strIngredient4 ?? ""
                    mealWithDefaults.strIngredient5 = mealWithDefaults.strIngredient5 ?? ""
                    mealWithDefaults.strIngredient6 = mealWithDefaults.strIngredient6 ?? ""
                    mealWithDefaults.strIngredient7 = mealWithDefaults.strIngredient7 ?? ""
                    mealWithDefaults.strIngredient8 = mealWithDefaults.strIngredient8 ?? ""
                    mealWithDefaults.strIngredient9 = mealWithDefaults.strIngredient9 ?? ""
                    mealWithDefaults.strIngredient10 = mealWithDefaults.strIngredient10 ?? ""
                    mealWithDefaults.strIngredient11 = mealWithDefaults.strIngredient11 ?? ""
                    mealWithDefaults.strIngredient12 = mealWithDefaults.strIngredient12 ?? ""
                    mealWithDefaults.strIngredient13 = mealWithDefaults.strIngredient13 ?? ""
                    mealWithDefaults.strIngredient14 = mealWithDefaults.strIngredient14 ?? ""
                    mealWithDefaults.strIngredient15 = mealWithDefaults.strIngredient15 ?? ""
                    mealWithDefaults.strIngredient16 = mealWithDefaults.strIngredient16 ?? ""
                    mealWithDefaults.strIngredient17 = mealWithDefaults.strIngredient17 ?? ""
                    mealWithDefaults.strIngredient18 = mealWithDefaults.strIngredient18 ?? ""
                    mealWithDefaults.strIngredient19 = mealWithDefaults.strIngredient19 ?? ""
                    mealWithDefaults.strIngredient20 = mealWithDefaults.strIngredient20 ?? ""

                    return mealWithDefaults
                }

                completion(mealsWithDefaults)
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }

        }.resume()
    }

    func fetchMealDetails(byId mealId: String, completion: @escaping (Meal?) -> Void) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            do {
                let mealsResponse = try JSONDecoder().decode(MealsResponse.self, from: data)
                if let meal = mealsResponse.meals.first {
                    completion(meal)
                } else {
                    completion(nil)
                }
            } catch {
                completion(nil)
            }
        }.resume()
    }
}
struct MealsResponse: Codable {
    let meals: [Meal]
}



import SwiftUI

struct ContentView: View {
    @State private var dessertMeals: [Meal] = []
    @State private var selectedMeal: Meal? = nil
    @State private var isDetailViewActive = false
    @State private var isMealDetailsFetched = false

    private let mealService = MealService()

    var body: some View {
        NavigationView {
            List(dessertMeals) { meal in
                NavigationLink(
                    destination: MealDetailView(meal: selectedMeal ?? meal)
                        .onAppear {
                            if !isMealDetailsFetched {
                                fetchMealDetails(for: meal.idMeal)
                            }
                        },
                    label: {
                        Text(meal.strMeal)
                    })
            }
            .navigationTitle("Dessert Meals")
            .onAppear {
                fetchDessertMeals()
            }
            .onAppear {
                // Reset the flag when ContentView appears
                isMealDetailsFetched = false
            }
        }
    }

    private func fetchDessertMeals() {
        mealService.fetchDessertMeals { meals in
            if let meals = meals {
                print(meals)
                DispatchQueue.main.async {
                    dessertMeals = meals.sorted(by: { $0.strMeal < $1.strMeal })
                    print("Fetch meals", dessertMeals)
                }
            } else {
                print("Failed to fetch dessert meals")
            }
        }
    }

    private func fetchMealDetails(for mealId: String) {
        mealService.fetchMealDetails(byId: mealId) { meal in
            if let meal = meal {
                DispatchQueue.main.async {
                    // Handle the fetched meal details, if needed
                    print("Fetched meal details: \(meal)")
                    isMealDetailsFetched = true
                    selectedMeal = meal
                    isDetailViewActive = true
                }
            } else {
                print("Failed to fetch meal details")
            }
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}


import XCTest
@testable import AdvancedProgrammingFinalProject

final class AdvancedProgrammingFinalProjectTests: XCTestCase {
    func test_FoodArray_FirstTitle_TitleEqualsFood1() {
        let vm = MenuViewViewModel(MockData())
        XCTAssertEqual(vm.foods[0].title, "Food 1")
    }
    
    func test_IngredientsArray_FirstIngredient_IngredientEqualsTomatoSauce() {
        let vm = MenuViewViewModel(MockData())
        let ingredient = vm.foods[0].ingredients[0]
        XCTAssertEqual(ingredient, Ingredient.tomatoSauce)
    }
}

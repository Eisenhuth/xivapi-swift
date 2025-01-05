import Testing
import xivapi_swift

@Suite("Recipe")
struct Recipe_Tests {
    let xivapi = xivapiClient()

    @Test("Recipe: Tincture") func Recipe() async throws {
        let recipe = try #require(await xivapi.getRecipe(35918)) //Grade 2 Gemdraught of Strength
        
        #expect(recipe.itemResult.row_id == 44162)
        #expect(recipe.amountResult == 3)
        #expect(recipe.canHq == true)
        #expect(recipe.canQuickSynth == recipe.fields.CanQuickSynth)
        #expect(recipe.craftType == "Alchemy")
        
        #expect(recipe.rawIngredients.contains { $0.value == 44051 }) //Sanctified Water
        #expect(recipe.ingredients.first != recipe.ingredients.last)
        #expect(recipe.recipeLevelTable.fields.Stars == 2)
        #expect(recipe.ingredients.contains { $0.itemId == 44051 })
        let firstIngredient = recipe.ingredients.first
        #expect(firstIngredient?.id == firstIngredient?.itemId)
    }

}

import Testing
import xivapi_swift

@Suite("Embedded")
struct EmbeddedResources_Tests {
    let xivapi = xivapiClient()
    
    @Test("Recipe Lookup") func RecipeLookup() async throws {
        let itemRecipes = try #require(await xivapi.getItemRecipes(itemId: 5057)) //Item: Iron Ingot
        #expect(itemRecipes == [43, 189]) //Blacksmith, Armorer
    }
    
    @Test("All Recipes") func AllRecipes() async throws { #expect(await xivapi.getItemRecipeDict().count > 0) }

}

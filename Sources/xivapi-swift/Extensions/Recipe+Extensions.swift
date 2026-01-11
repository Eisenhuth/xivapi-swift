public extension Recipe {
    var itemResult: Item { fields.ItemResult }
    var amountResult: Int { fields.AmountResult }
    var canHq: Bool { fields.CanHq }
    var canQuickSynth: Bool { fields.CanQuickSynth }
    var craftType: String { fields.CraftType.name }
    var rawIngredients: [RecipeIngredient] { fields.Ingredient}
    var recipeLevelTable: RecipeLevelTable { fields.RecipeLevelTable }
    
    var ingredients: [Ingredient] {
        
        var _ingredients = [Ingredient]()
        
        for i in 0..<fields.Ingredient.count {
            if fields.AmountIngredient[i] != 0 && fields.Ingredient[i].value > 0 {
                _ingredients.append(Ingredient(amount: fields.AmountIngredient[i], itemId: fields.Ingredient[i].value))
            }
        }
        
        return _ingredients
    }
}

public struct Ingredient: Codable, Hashable, Identifiable {
    public var amount: Int
    public var itemId: Int
}

public extension Ingredient {
    var id: Int { itemId }
    
    static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        return lhs.itemId == rhs.itemId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(itemId)
    }
}

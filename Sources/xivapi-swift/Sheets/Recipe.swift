import Foundation

public struct Recipe: Codable {
    public let schema: String?
    public let row_id: Int
    public let fields: RecipeFields
}

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

public struct RecipeFields: Codable {
    public let AmountIngredient: [Int]
    public let AmountResult: Int
    public let CanHq: Bool
    public let CanQuickSynth: Bool
    public let CraftType: CraftType
    public let Ingredient: [RecipeIngredient]
    public let IsExpert: Bool
    public let IsSecondary: Bool
    public let IsSpecializationRequired: Bool
    public let ItemResult: Item
    public let RecipeLevelTable: RecipeLevelTable
//    public let RecipeNotebookList: RecipeNotebookList
    public let RequiredControl: Int
    public let RequiredCraftsmanship: Int
    public let SecretRecipeBook: SecretRecipeBook
    
}

public struct RecipeIngredient: Codable {
    public let value: Int
}

public struct CraftType: Codable {
    public let fields: CraftTypeFields
    public var name: String {fields.Name}
    
    public struct CraftTypeFields: Codable {
        public let Name: String
    }
}

public struct RecipeLevelTable: Codable {
    public let value: Int
    public let row_id: Int
    public let fields: RecipeLevelFields
    
    public struct RecipeLevelFields: Codable {
        public let ClassJobLevel: Int
        public let ConditionsFlag: Int
        public let Difficulty: Int
        public let Durability: Int
        public let ProgressDivider: Int
        public let ProgressModifier: Int
        public let Quality: Int
        public let QualityDivider: Int
        public let QualityModifier: Int
        public let Stars: Int
        public let SuggestedControl: Int?
        public let SuggestedCraftsmanship: Int
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



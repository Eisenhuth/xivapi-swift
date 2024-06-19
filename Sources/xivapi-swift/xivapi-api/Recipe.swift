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
    var rawIngredients: [Item] { fields.Ingredient }
    var recipeLevelTable: RecipeLevelTable { fields.RecipeLevelTable }
    
    var ingredients: [Ingredient] {
        
        var _ingredients = [Ingredient]()
        
        for i in 0..<10 {
            if fields.AmountIngredient[i] != 0 {
                _ingredients.append(Ingredient(amount: fields.AmountIngredient[i], item: fields.Ingredient[i]))
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
    public let Ingredient: [Item]
    public let IsExpert: Bool
    public let IsSecondary: Bool
    public let IsSpecializationRequired: Bool
    public let ItemResult: Item
    public let RecipeLevelTable: RecipeLevelTable
//    public let RecipeNotebookList: RecipeNotebookList
    public let RequiredControl: Int
    public let RequiredCraftsmanship: Int
//    public let SecretRecipeBook: SecretRecipeBook
    
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
        public let SuggestedControl: Int
        public let SuggestedCraftsmanship: Int
    }
}

public struct Ingredient: Codable, Hashable, Identifiable {
    public var amount: Int
    public var item: Item
}

public extension Ingredient {
    public var id: UUID { UUID() }
    
    public static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        return lhs.item.row_id == rhs.item.row_id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(item.row_id ?? 0)
    }
}



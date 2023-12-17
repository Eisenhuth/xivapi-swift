import Foundation

public struct XivRecipe: Codable{
    public let AmountIngredient0: Int?
    public let AmountIngredient1: Int?
    public let AmountIngredient2: Int?
    public let AmountIngredient3: Int?
    public let AmountIngredient4: Int?
    public let AmountIngredient5: Int?
    public let AmountIngredient6: Int?
    public let AmountIngredient7: Int?
    public let AmountIngredient8: Int?
    public let AmountIngredient9: Int?
    public let AmountResult: Int?
    //public let ClassJob: XivClassJob?
    //public let CraftType: XivCraftType?
    public let ItemIngredient0: XivItem?
    public let ItemIngredient1: XivItem?
    public let ItemIngredient2: XivItem?
    public let ItemIngredient3: XivItem?
    public let ItemIngredient4: XivItem?
    public let ItemIngredient5: XivItem?
    public let ItemIngredient6: XivItem?
    public let ItemIngredient7: XivItem?
    public let ItemIngredient8: XivItem?
    public let ItemIngredient9: XivItem?
    public let ItemResult: XivItem?
    public let Name: String?
    public let Name_de: String?
    public let Name_en: String?
    public let Name_fr: String?
    public let Name_ja: String?
    public let RecipeLevelTable: XivRecipeLevelTable?
    
    public let ID: Int?
}

public extension XivRecipe {
    var ingredient0: Ingredient{ Ingredient(amount: AmountIngredient0, item: ItemIngredient0) }
    var ingredient1: Ingredient{ Ingredient(amount: AmountIngredient1, item: ItemIngredient1) }
    var ingredient2: Ingredient{ Ingredient(amount: AmountIngredient2, item: ItemIngredient2) }
    var ingredient3: Ingredient{ Ingredient(amount: AmountIngredient3, item: ItemIngredient3) }
    var ingredient4: Ingredient{ Ingredient(amount: AmountIngredient4, item: ItemIngredient4) }
    var ingredient5: Ingredient{ Ingredient(amount: AmountIngredient5, item: ItemIngredient5) }
    var ingredient6: Ingredient{ Ingredient(amount: AmountIngredient6, item: ItemIngredient6) }
    var ingredient7: Ingredient{ Ingredient(amount: AmountIngredient7, item: ItemIngredient7) }
    var ingredient8: Ingredient{ Ingredient(amount: AmountIngredient8, item: ItemIngredient8) }
    var ingredient9: Ingredient{ Ingredient(amount: AmountIngredient9, item: ItemIngredient9) }
    
    var ingredients: [Ingredient]{
        let _ingredients = [
            ingredient0, ingredient1,
            ingredient2, ingredient3,
            ingredient4, ingredient5,
            ingredient6, ingredient7,
            ingredient8, ingredient9
        ]
        let filteredIngredients = _ingredients.filter { $0.amount ?? 0 > 0 }
        
        return filteredIngredients
    }
    
    var ingredientIds: [Int] { ingredients.map { $0.item!.ID! } }
}

public struct Ingredient: Codable, Hashable, Identifiable {
    public var amount: Int?
    public var item: XivItem?
}

public extension Ingredient {
    var id: UUID { UUID()}
    
    static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        return lhs.item?.ID == lhs.item?.ID
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(amount ?? 0)
    }
}

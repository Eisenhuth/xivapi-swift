import Foundation

public struct XivGameContentLinks: Codable {
    public let GCScripShopItem: ShopItem?
    public let GilShopItem: ShopItem?
    public let Recipe: GameContentRecipe?
    public let SpecialShop: SpecialShop?
    public let TripleTriad: TripleTriad?
}

public struct GameContentRecipe: Codable {
    public let ItemIngredient0: [Int]?
    public let ItemIngredient1: [Int]?
    public let ItemIngredient2: [Int]?
    public let ItemIngredient3: [Int]?
    public let ItemIngredient4: [Int]?
    public let ItemIngredient5: [Int]?
    //TODO: check ingredient 6 and 7, always crystals?
}

public extension GameContentRecipe {
    var usedIn: [Int] {
        var arr = [Int]()
        arr.append(contentsOf: ItemIngredient0 ?? [])
        arr.append(contentsOf: ItemIngredient1 ?? [])
        arr.append(contentsOf: ItemIngredient2 ?? [])
        arr.append(contentsOf: ItemIngredient3 ?? [])
        arr.append(contentsOf: ItemIngredient4 ?? [])
        arr.append(contentsOf: ItemIngredient5 ?? [])
        
        return arr
    }
}

public struct ShopItem: Codable{
    //TODO: public let Item: [String]
}

public struct SpecialShop: Codable {
    //TODO: [String : [Int]]
}

public struct TripleTriad: Codable {
    public let ItemPossibleReward0: [Int]?
    public let ItemPossibleReward1: [Int]?
    public let ItemPossibleReward2: [Int]?
    public let ItemPossibleReward3: [Int]?
    public let ItemPossibleReward4: [Int]?
    public let ItemPossibleReward5: [Int]?
    public let ItemPossibleReward6: [Int]?
    public let ItemPossibleReward7: [Int]?
    public let ItemPossibleReward8: [Int]?
}

public struct RetainerTaskNormal: Codable {
    //TODO: for future me
}

public struct SpecialShop: Codable {
    public let row_id: Int
    public let fields: SpecialShopFields
}

public struct SpecialShopFields: Codable {
    public let Item: [SpecialShopItem]
    public let Name: String
    public let UseCurrencyType: Int
}

public struct SpecialShopItem: Codable {
//    public let AchievementUnlock: Achievement
    public let Category: [SpecialShopItemCategory]
    public let CollectabilityCost: [Int]
    public let CostType: [Int]
    public let CurrencyCost: [Int]
    public let Item: [Item]
    public let ItemCost: [Item]
    public let Order: Int
    public let PatchNumber: Int
//    public let Quest: Quest
    public let ReceiveCount: [Int]
    public let ReceiveHq: [Bool]
    
    public let Unknown0: [Int]
    public let Unknown1: [Int]
    public let Unknown2: Int
}

public struct SpecialShopItemCategory: Codable {
    public let row_id: Int
    public let fields: SpecialShopItemCategoryFields
}

public struct SpecialShopItemCategoryFields: Codable {
    public let Name: String
}

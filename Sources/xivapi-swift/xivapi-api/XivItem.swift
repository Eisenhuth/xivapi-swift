import Foundation

public struct XivItem : Codable {
    public let Name: String?
    public let Name_de: String?
    public let Name_en: String?
    public let Name_fr: String?
    public let Name_ja: String?
    public let Description: String?
    public let LevelEquip: Int?
    public let LevelItem: Int?
    public let ID: Int?
    public let Icon: String?
    public let IconHD: String?
    public let IsUntradable: Int?
    public let CanBeHq: Int?
    public let PriceLow: Int? //price to sell to vendor
    public let PriceMid: Int? //price to buy from vendor
    public let Rarity: Int?
    public let ClassJobUse: XivClassJobUse?
    //TODO: fix this - public let GameContentLinks: [XivGameContentLinks]?
    public let GamePatch: XivGamePatch?
    public let ItemKind: XivItemKind?
    public let ItemSearchCategory: XivItemSearchCategory?
    public let ItemUICategory: XivItemUICategory?
    public let Recipes: [XivItemRecipe]?
    
}

public struct XivItemRecipe : Codable, Hashable {
    public let ClassJobID: Int?
    public let ID: Int?
    public let Level: Int?
}

public extension XivItem{
    var isCraftable: Bool { Recipes != nil}
    //var isVendorItem: Bool { GameContentLinks?.GilShopItem != nil || GameContentLinks?.GCScripShopItem != nil }
    //var vendorPrice: Int? { isVendorItem ? PriceLow : nil }
    var canBeHQ: Bool { CanBeHq == 1 }
    var iconUrl: URL? { Icon != nil ? URL(string: "https://xivapi.com\(Icon!)") : nil }
    var iconUrlHD: URL? { IconHD != nil ? URL(string:  "https://xivapi.com\(IconHD!)") : nil }
    var descriptionWithoutTags: String? { Description?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil) ?? nil }
}
 

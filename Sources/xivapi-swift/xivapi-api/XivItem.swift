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
    //TODO: //public var ClassJobUse: XivClassJobUse?
    //TODO: //public let GameContentLinks: XivGameContentLinks?
    public let GamePatch: XivGamePatch?
    //TODO: //public var ItemKind: XivItemKind?
    //TODO: //public var ItemSearchCategory: XivItemSearchCategory?
    public var Recipes: [Recipe]?
    
}

public extension XivItem {
    struct Recipe : Codable {
        public var ClassJobID: Int?
        public var ID: Int?
        public var Level: Int?
    }
}

public extension XivItem{
    var isCraftable: Bool { Recipes != nil}
    var canBeHQ: Bool { CanBeHq == 1 ? true : false }
    var iconUrl: URL? { Icon != nil ? URL(string: "https://xivapi.com\(Icon!)") : nil }
    var iconUrlHD: URL? { IconHD != nil ? URL(string:  "https://xivapi.com\(IconHD!)") : nil }
}
 

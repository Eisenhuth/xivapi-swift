import Foundation

public struct XivSpecialShop: Codable {
    public let ID: Int?
    public let GamePatch: XivGamePatch?
    //TODO: all the fuckery with ItemCost, ItemReceive
    public let Name: String?
    public let Name_de: String?
    public let Name_en: String?
    public let Name_fr: String?
    public let Name_ja: String?
    
    public let Url: String?
    public let UseCurrencyType: Int?
}

import Foundation

public struct XivItemUICategory: Codable {
    public let ID: Int?
    public let Icon: String?
    public let IconHD: String?
    public let IconID: Int?
    public let Name: String?
    public let Name_de: String?
    public let Name_en: String?
    public let Name_fr: String?
    public let Name_ja: String?
    public let OrderMajor: Int?
    public let OrderMinor: Int?
}

public extension XivItemUICategory {
    var iconUrl: URL? { Icon != nil ? URL(string: "https://xivapi.com\(Icon!)") : nil }
    var iconUrlHD: URL? { IconHD != nil ? URL(string:  "https://xivapi.com\(IconHD!)") : nil }
}

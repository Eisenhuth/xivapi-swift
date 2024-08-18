import Foundation

public struct ItemUICategory: Codable {
    public let value: Int
    public let sheet: String?
    public let row_id: Int?
    public let fields: ItemUICategoryFields?
}

public struct ItemUICategoryFields: Codable {
    public let Icon: Icon
    public let Name: String
}

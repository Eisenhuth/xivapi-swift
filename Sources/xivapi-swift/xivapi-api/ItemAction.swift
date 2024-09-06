import Foundation

public struct ItemAction: Codable {
    public let fields: ItemActionFields
}

public struct ItemActionFields: Codable {
    public let Data: [Int]
    public let DataHQ: [Int]
    public let type: Int
    
    enum CodingKeys: String, CodingKey {
        case Data
        case DataHQ
        case type = "Type"
    }
}

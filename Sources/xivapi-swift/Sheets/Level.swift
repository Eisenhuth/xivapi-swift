import Foundation

public struct Level: Codable {
    public let row_id: Int
    public let fields: LevelFields
}

public struct LevelFields: Codable {
//    public let EventId
//    public let Map: XivMap //TODO: revisit this later
//    public let Object
    public let Radius: Double
    public let Territory: TerritoryType
    public let type: Int
    public let X: Double
    public let Y: Double
    public let Yaw: Double
    public let Z: Double
    
    enum CodingKeys: String, CodingKey {
//        case Map
        case Radius
        case Territory
        case type = "Type"
        case X
        case Y
        case Yaw
        case Z
    }
}

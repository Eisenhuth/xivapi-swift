import Foundation

public struct XivMap: Codable {
    public let fields: MapFields
}

public struct MapFields: Codable {
    public let Id: String
    public let OffsetX: Int
    public let OffsetY: Int
    public let PlaceName: PlaceName
    public let PlaceNameRegion: PlaceNameRegion
    public let SizeFactor: Int
    public let TerritoryType: TerritoryType
}

public struct PlaceName: Codable {
    public let fields: PlaceNameFields
}

public struct PlaceNameFields: Codable {
    public let Name: String
}

public struct PlaceNameRegion: Codable {
    public let fields: PlaceNameRegionFields
}

public struct PlaceNameRegionFields: Codable {
    public let Name: String
}

public struct TerritoryType: Codable {
    public let value: Int?
    public let fields: TerritoryTypeFields
}

public struct TerritoryTypeFields: Codable {
    let Name: String
}

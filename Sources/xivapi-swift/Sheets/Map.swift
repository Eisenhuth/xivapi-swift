import Foundation

public struct XivMap: Codable {
    public let fields: MapFields
}

public extension XivMap {
    var name: String { fields.PlaceName.fields.Name }
    var region: String { fields.PlaceNameRegion.fields.Name }
    
    var mapPath: String {
        let territoryId = fields.Id
        let path = "ui/map/\(territoryId)/\(territoryId.replacingOccurrences(of: "/", with: ""))_m.tex"
        return path
    }
    
    /// a map composed from the map and background textures
    var compositedMapPath: String { "map/\(fields.Id)" }
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

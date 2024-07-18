import Foundation

public struct XivMap: Codable {
    public let fields: MapFields
}

public extension XivMap {
    var name: String { fields.PlaceName.fields.Name }
    var region: String { fields.PlaceNameRegion.fields.Name }
    var mapUrl: URL? {
        
        let territoryName = fields.TerritoryType.fields.Name
        let territoryId = fields.Id
        let path = "ui/map/\(territoryId)/\(territoryId.replacingOccurrences(of: "/", with: ""))_m.tex"
        let url = Endpoint.asset(at: path)
        
        return url
    }
}

public struct MapFields: Codable {
    public let Id: String
    public let PlaceName: PlaceName
    public let PlaceNameRegion: PlaceNameRegion
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

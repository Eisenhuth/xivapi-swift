import Foundation

public struct XivMap: Codable {
    public let fields: MapFields
}

public extension XivMap {
    var name: String { fields.PlaceName.fields.Name }
    var region: String { fields.PlaceNameRegion.fields.Name }
    
    func mapUrl(format: Format = .jpg) -> URL? {
        let territoryId = fields.Id
        let path = "ui/map/\(territoryId)/\(territoryId.replacingOccurrences(of: "/", with: ""))_m.tex"
        return Endpoint.asset(at: path, format: format)
    }
    
    /// a map composed from the map and background textures
    var compositedMapUrl: URL? {
        let path = "map/\(fields.Id)"
        var components = URLComponents(string: "\(Endpoint.baseUrl)/asset/\(path)")!
        components.queryItems = [URLQueryItem(name: "format", value: "jpg")]
        return components.url
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

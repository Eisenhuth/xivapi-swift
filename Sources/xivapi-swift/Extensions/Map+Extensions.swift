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

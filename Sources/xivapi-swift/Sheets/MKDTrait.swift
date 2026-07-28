public struct MKDTrait: Codable {
    public let fields: MKDTraitFields
}

public struct MKDTraitFields: Codable {    
    public let Description: String
    public let Icon: Icon
    public let LevelUnlock: Int
    public let MKDSupportJob: MKDSupportJob
    public let Name: String
}

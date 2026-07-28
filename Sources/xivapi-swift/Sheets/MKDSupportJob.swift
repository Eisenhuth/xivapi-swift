public struct MKDSupportJob: Codable {
    public let fields: MKDSupportJobFields
}

public struct MKDSupportJobFields: Codable {
//    public let Action: [Action]
    public let Description: String
    public let JobIndex: Int
    public let LevelMax: Int
    public let LevelUnlock: [Int]
    public let Name: String
    public let NameEnglish: String
    public let NameFemale: String
    public let NameShort: String
}

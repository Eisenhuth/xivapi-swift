import Foundation

public struct Trait: Codable {
    public let fields: TraitFields
}

public struct TraitFields: Codable {
//    public let ClassJob: ClassJob
    public let ClassJobCategory: ClassJobCategory
    public let Icon: Icon
    public let Level: Int
    public let Name: String
//    public let Quest: Quest
}

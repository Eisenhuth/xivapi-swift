import Foundation

public struct Trait: Codable {
    public let fields: TraitFields
}

public extension Trait {
    var icon: Icon { fields.Icon }
    var level: Int { fields.Level }
    var name: String { fields.Name }
}

public struct TraitFields: Codable {
//    public let ClassJob: ClassJob
//    public let ClassJobCategory
    public let Icon: Icon
    public let Level: Int
    public let Name: String
//    public let Quest: Quest
}

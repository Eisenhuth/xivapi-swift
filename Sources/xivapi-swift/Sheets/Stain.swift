import Foundation

public struct Stain: Codable {
    public let row_id: Int
    public let fields: StainFields
    public let transient: StainTransient?
}

public struct StainFields: Codable {
    public let Color: Int
    public let InlineName: String
    public let IsHousingApplicable: Bool
    public let IsMetallic: Bool
    public let Name: String
    public let Shade: Int
    public let SubOrder: Int
}

public struct StainTransient: Codable {
    public let Item1: Item
    public let Item2: Item
}

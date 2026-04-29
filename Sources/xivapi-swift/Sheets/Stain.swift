import Foundation

public struct Stain: Codable {
    public let row_id: Int
    public let fields: StainFields
}

public struct StainFields: Codable {
    public let Color: Int
    public let InlineName: String
    public let IsHousingApplicable: Bool
    public let IsMetallic: Bool
    public let Item: [Item]
    public let Name: String
    public let Shade: Int
    public let SubOrder: Int
}

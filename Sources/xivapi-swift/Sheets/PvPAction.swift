import Foundation

public struct PvPAction: Codable {
    public let fields: PvPActionFields
}

public struct PvPActionFields: Codable {
    public let Action: Action
}

import Foundation

public struct PvPAction: Codable {
    public let fields: PvPActionFields
}

public extension PvPAction {
    var action: Action { fields.Action }
}

public struct PvPActionFields: Codable {
    public let Action: Action
}

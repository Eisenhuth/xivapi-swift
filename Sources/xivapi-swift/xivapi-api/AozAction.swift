import Foundation

public struct AozAction: Codable {
    public let row_id: Int
    public let fields: AozActionFields
    public let transient: AozActionTransientFields
}

public extension AozAction {
    var name: String { fields.Action.name }
    var number: Int { transient.Number }
    var category: ActionCategory { fields.Action.category }
    var actionIcon: Icon { fields.Action.icon }
    var transientIcon: Icon { transient.Icon }
    var description: String { transient.Description }
}

public struct AozActionFields: Codable {
    public let Action: Action
    public let Rank: Int
}

public struct AozActionTransientFields: Codable {
    public let CauseBind: Bool
    public let CauseBlind: Bool
    public let CauseDeath: Bool
    public let CauseHeavy: Bool
    public let CauseInterrupt: Bool
    public let CauseParalysis: Bool
    public let CausePetrify: Bool
    public let CauseSleep: Bool
    public let CauseSlow: Bool
    public let CauseStun: Bool
    
    public let Description: String
    public let Icon: Icon
    public let Location: AozLocation
    public let LocationKey: Int
    public let Number: Int
    public let Stats: String
    public let TargetsEnemy: Bool
    public let TargetsSelfOrAlly: Bool
}

public struct AozLocation: Codable {
    public let value: Int
    public let fields: AozLocationFields?
    
    public struct AozLocationFields: Codable {
        public let Name: String
    }
}

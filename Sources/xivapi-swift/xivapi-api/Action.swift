import Foundation

public struct Action: Codable {
    public let fields: ActionFields
}

public extension Action {
    var name: String { fields.Name }
    var icon: Icon { fields.Icon }
    var category: ActionCategory { fields.ActionCategory }
    //description??
}

public struct ActionFields: Codable {
    public let ActionCategory: ActionCategory
//    public let ActionCombo: Action //TODO: work around recursion
//    public let ActionProcStatus: ActionProcStatus
//    public let ActionTimelineHit: ActionTimelineHit
    public let ClassJobCategory: ClassJobCategory
    public let Icon: Icon
    public let MaxCharges: Int
    public let Name: String
    public let StatusGainSelf: XivStatus
}

public struct ActionCategory: Codable {
    public let value: Int
    public let sheet: String
    public let row_id: Int
    public let fields: ActionCategoryFields
    public var name: String { fields.Name }
    
    public struct ActionCategoryFields: Codable {
        public let Name: String
    }
}

import Foundation

public struct Action: Codable {
    public let fields: ActionFields
    public let transient: ActionTransientFields?
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

public struct ActionTransientFields: Codable {
    public let Description: String
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

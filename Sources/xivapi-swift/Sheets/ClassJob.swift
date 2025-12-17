import Foundation

public struct ClassJob: Codable {
    public let row_id: Int
    public let fields: ClassJobFields
}

public struct ClassJobFields: Codable {
    public let Abbreviation: String
    public let CanQueueForDuty: Bool
    public let ClassJobCategory: ClassJobCategory
//    public let ClassJobParent: ClassJob //TODO: work around recursion
    public let IsLimitedJob: Bool
    public let ItemSoulCrystal: Item
    public let ItemStartingWeaponMainHand: Item
    public let ItemStartingWeaponOffHand: Item
    public let LimitBreak1: Action
    public let LimitBreak2: Action
    public let LimitBreak3: Action
    public let Name: String
    public let NameEnglish: String
    public let PrimaryStat: Int
    public let Role: Int
    public let StartingLevel: Int
    public let StartingTown: Town
}



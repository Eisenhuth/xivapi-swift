import Foundation

public struct ContentFinderCondition: Codable {
    public let row_id: Int?
    public let fields: ContentFinderConditionFields
}

public struct ContentFinderConditionFields: Codable {
    public let AcceptClassJobCategory: ClassJobCategory
    public let AllianceRoulette: Bool
    public let AllowExplorerMode: Bool
    public let AllowReplacement: Bool
    public let AllowUndersized: Bool
    public let ClassJobLevelRequired: Int
    public let ClassJobLevelSync: Int
    public let Content: InstanceContent
    public let ContentType: ContentType
    public let DailyFrontlineChallenge: Bool
    public let DutyRecorderAllowed: Bool
    public let ExpertRoulette: Bool
    public let FeastTeamRoulette: Bool
    public let GuildHestRoulette: Bool
    public let HighEndDuty: Bool
    public let HighLevelRoulette: Bool
    public let Icon: Icon
    public let Image: Icon
    public let ItemLevelRequired: Int
    public let ItemLevelSync: Int
    public let LevelCapRoulette: Bool
    public let LevelingRoulette: Bool
    public let MSQRoulette: Bool
    public let MentorRoulette: Bool
    public let Name: String
    public let NameShort: String
    public let NormalRaidRoulette: Bool
    public let PvP: Bool
    public let ShortCode: String
    public let SortKey: Int
    public let TerritoryType: TerritoryType
    public let Transient: ContentFinderConditionTransient
}



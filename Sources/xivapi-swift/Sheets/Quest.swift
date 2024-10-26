import Foundation

public struct Quest: Codable {
    public let row_id: Int
    public let fields: QuestFields
}

public struct QuestFields: Codable {
    public let ActionReward: Action
//    public let BeastReputationRank: BeastReputationRank
//    public let BeastReputationValue: Int
//    public let BeastTribe: BeastTribe
    public let CanCancel: Bool
    public let ClassJobCategory0: ClassJobCategory
    public let ClassJobCategory1: ClassJobCategory
    public let ClassJobLevel: [Int]
//    public let ClassJobRequired: ClassJob //TODO: fix whatever is going wrong here
//    public let ClassJobUnlock: ClassJob //TODO: same as above
    public let CurrencyReward: Item
    public let CurrencyRewardCount: Int
//    public let DeliveryQuest: DeliveryQuest
//    public let EmoteReward: Emote
//    public let EventIconType: EventIconType
    public let ExpFactor: Int
//    public let Expansion: ExVersion
//    public let Festival: Festival
    public let GilReward: Int
    public let Icon: Icon
    public let IconSpecial: Icon
    public let Id: String
//    public let InstanceContent: [InstanceContent]
//    public let InstanceContentUnlock: InstanceContent
    public let Introduction: Bool
    public let IsHouseRequired: Bool
    public let IsRepeatable: Bool
//    public let IssuerLocation: Level
    public let IssuerStart: ENpcResident
    public let ItemCatalyst: [Item]
    public let ItemCountCatalyst: [Int]
    public let ItemCountReward: [Int]
    public let ItemRewardType: Int
//    public let JournalGenre: JournalGenre
    public let LevelMax: Int
//    public let MountRequired: Mount
    public let Name: String
    public let OptionalItemCountReward: [Int]
    public let OptionalItemIsHQReward: [Bool]
    public let OptionalItemReward: [Item]
//    public let OptionalItemStainReward: [Stain]
//    public let OtherReward: QuestRewardOther
    public let PlaceName: PlaceName
//    public let PreviousQuest: Quest //TODO: work around recursion
    public let Reward: [Item]
//    public let RewardStain: [Stain]
    public let SatisfactionLevel: Int
//    public let SatisfactionNpc: SatisfactionNpc
    public let TargetEnd: ENpcResident
}

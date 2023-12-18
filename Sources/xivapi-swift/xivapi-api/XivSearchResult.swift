import Foundation

public struct XivSearchResult: Codable {
    public let Pagination: XivPagination?
    public let Results: [XivResult]?
    public let SpeedMs: Int?
}

public struct XivPagination: Codable {
    public let Page: Int?
    public let PageNext: Int?
    public let PagePrev: Int?
    public let PageTotal: Int?
    public let Results: Int?
    public let ResultsPerPage: Int?
    public let ResultsTotal: Int?
}

public struct XivResult: Codable {
    public let ID: Int?
    public let Icon: String?
    public let Name: String?
    public let Url: String?
    public let UrlType: String?
}

public enum XivSearchIndexes: String{
    case Achievement, Title, Action, CraftAction, Trait, PvPAction, PvPTrait, Status, BNpcName, ENpcResident, Companion, Mount, Leve, Emote, InstanceContent, Item, Recipe, Fate, Quest, ContentFinderCondition, Balloon, BuddyEquip, Orchestrion, PlaceName, Weather, World, Map, lore_finder
}

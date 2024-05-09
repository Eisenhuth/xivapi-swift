import Foundation

public struct XivSearchResult: Codable {
    public let Pagination: XivPagination?
    public var Results: [XivResult]?
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

public struct XivResult: Codable, Hashable {
    public let ID: Int?
    public let Icon: String?
    public let Name: String?
    public let Url: String?
    public let UrlType: String?
}

public extension XivResult {
    var iconUrl: URL? { Icon != nil ? URL(string: "https://xivapi.com\(Icon!)") : nil }
    var category: XivSearchIndexes? {
        if let urlType = UrlType {
            return XivSearchIndexes(rawValue: urlType)
        }
        return nil
    }
    
    var categoryName: String?{
        if let category {
            return switch category {
            case .Achievement:
                "Achievement"
            case .Title:
                "Title"
            case .Action:
                "Action"
            case .CraftAction:
                "Craft Action"
            case .Trait:
                "Trait"
            case .PvPAction:
                "PvP Action"
            case .PvPTrait:
                "PvP Trait"
            case .Status:
                "Status"
            case .BNpcName:
                "Battle NPC Name"
            case .ENpcResident:
                "NPC Name"
            case .Companion:
                "Companion"
            case .Mount:
                "Mount"
            case .Leve:
                "Leve"
            case .Emote:
                "Emote"
            case .InstanceContent:
                "Instanced Content"
            case .Item:
                "Item"
            case .Recipe:
                "Recipe"
            case .Fate:
                "FATE"
            case .Quest:
                "Quest"
            case .ContentFinderCondition:
                "Content Finder Condition"
            case .Balloon:
                "Balloon"
            case .BuddyEquip:
                "Buddy Equip"
            case .Orchestrion:
                "Orchestrion"
            case .PlaceName:
                "Place Name"
            case .Weather:
                "Weather"
            case .World:
                "World"
            case .Map:
                "Map"
            case .lore_finder:
                "Lore"
            }
        }
        
        return nil
    }
        
}

public enum XivSearchIndexes: String{
    case Achievement, Title, Action, CraftAction, Trait, PvPAction, PvPTrait, Status, BNpcName, ENpcResident, Companion, Mount, Leve, Emote, InstanceContent, Item, Recipe, Fate, Quest, ContentFinderCondition, Balloon, BuddyEquip, Orchestrion, PlaceName, Weather, World, Map, lore_finder
}

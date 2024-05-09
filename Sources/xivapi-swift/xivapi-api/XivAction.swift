import Foundation

public struct XivAction: Codable {
    public let ActionCategory: XivActionCategory?
    public let ActionTimelineHit: XivActionTimelineHit?
    public let AnimationEnd: XivAnimationEnd?
    public let ClassJob: XivClassJob?
    public let Description: String?
    public let GameContentLinks: XivGameContentLinks?
    public let GamePatch: XivGamePatch?
    public let ID: Int?
    public let Icon: String?
    public let IconHD: String?
    public let Name: String?
    public let IsPvP: Int?
    public let MaxCharges: Int?
    public let PreservesCombo: Int?
    public let PrimaryCostType: Int?
    public let PrimaryCostValue: Int?
    public let Range: Int?
    public let SecondaryCostType: Int?
    public let SecondaryCostValue: Int?
    //TODO: public let StatusGainSelf:
    public let Url: String?
}

public extension XivAction {
    var descriptionWithoutTags: String? { Description?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil) ?? nil }
}

public struct XivActionCategory: Codable {
    public let ID: Int?
    public let Name: String?
    public let Name_de: String?
    public let Name_en: String?
    public let Name_fr: String?
    public let Name_ja: String?
}

public struct XivActionTimelineHit: Codable {
    public let ID: Int?
    public let Key: String?
    public let Key_en: String?
}

public struct XivAnimationEnd: Codable{
    public let ID: Int?
    public let Key: String?
    public let Key_en: String?
}

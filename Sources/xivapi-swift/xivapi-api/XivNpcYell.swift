import Foundation

public struct XivNpcYell: Codable, Identifiable {
    public let BalloonTime: Int?
    public let BattleTalkTime: Int?
    public let GamePatch: XivGamePatch?
    public let ID: Int
    public let IsBalloonSlow: Int?
    public let OutputType: Int?
    public let Patch: Int?
    public let Text: String?
    public let Text_de: String?
    public let Text_en: String?
    public let Text_fr: String?
    public let Text_ja: String?
    public let Url: String
}

public extension XivNpcYell {
    var id: Int { self.ID }
}

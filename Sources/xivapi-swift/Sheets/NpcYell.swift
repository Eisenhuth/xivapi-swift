import Foundation

public struct NpcYell: Codable {
    public let row_id: Int
    public let fields: NpcYellFields
}

public struct NpcYellFields: Codable {
    public let Text: String?
    
    public let Text_en: String?
    public let Text_ja: String?
    public let Text_de: String?
    public let Text_fr: String?
    public let Text_chs: String?
    public let Text_kr: String?
    
    enum CodingKeys: String, CodingKey {
        case Text
        case Text_en = "Text@en"
        case Text_ja = "Text@ja"
        case Text_de = "Text@de"
        case Text_fr = "Text@fr"
        case Text_chs = "Text@chs"
        case Text_kr = "Text@kr"
    }
}

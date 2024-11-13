import Foundation

public struct NpcYell: Codable {
    public let row_id: Int
    public let fields: NpcYellFields
}

public extension NpcYell {
    var Text: String? { fields.Text ?? fields.Text_en }
    var Text_en: String? { fields.Text_en ?? Text }
    var Text_ja: String? { fields.Text_ja }
    var Text_de: String? { fields.Text_de }
    var Text_fr: String? { fields.Text_fr }
    var Text_chs: String? { fields.Text_chs }
    var Text_kr: String? { fields.Text_kr }
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

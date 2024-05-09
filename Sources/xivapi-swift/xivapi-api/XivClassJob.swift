import Foundation

public struct XivClassJob: Codable {
    public let Abbreviation: String?
    public let ID: Int?
    public let Name: String?
    //public let NameEnglish: String?
    //public let StartingLevel: Int?
    public let Icon: String?
    //public let ClassJobCategory: XivClassJobCategory?
    //public let LimitBreak3: XivLimitBreak?
}

//public struct XivClassJobCategory: Codable{
//    public let ID: Int?
//    public let Name: String?
//    public let Name_de: String?
//    public let Name_en: String?
//    public let Name_fr: String?
//    public let Name_ja: String?
//    public let ACN: Int?
//    public let ADV: Int?
//    public let ALC: Int?
//    public let ARC: Int?
//    public let ARM: Int?
//    public let AST: Int?
//    public let BLM: Int?
//    public let BLU: Int?
//    public let BRD: Int?
//    public let BSM: Int?
//    public let BTN: Int?
//    public let CNJ: Int?
//    public let CRP: Int?
//    public let CUL: Int?
//    public let DNC: Int?
//    public let DRG: Int?
//    public let DRK: Int?
//    public let FSH: Int?
//    public let GLA: Int?
//    public let GNB: Int?
//    public let GSM: Int?
//    public let LNC: Int?
//    public let LTW: Int?
//    public let MCH: Int?
//    public let MIN: Int?
//    public let MNK: Int?
//    public let MRD: Int?
//    public let NIN: Int?
//    public let PGL: Int?
//    public let RDM: Int?
//    public let ROG: Int?
//    public let RPR: Int?
//    public let SAM: Int?
//    public let SCH: Int?
//    public let SGE: Int?
//    public let SMN: Int?
//    public let THM: Int?
//    public let WAR: Int?
//    public let WHM: Int?
//    public let WVR: Int?
//}

//public struct XivLimitBreak: Codable {
//    public let ID: Int?
//    public let Name: String?
//    public let ActionCategory: XivActionCategory?
//    public let ClassJobCategory: XivClassJobCategory?
//    
//}

public extension XivClassJob {
    var iconUrl: URL? { Icon != nil ? URL(string: "https://xivapi.com\(Icon!)")! : nil}
}

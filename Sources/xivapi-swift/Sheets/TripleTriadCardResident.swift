import Foundation

public struct TripleTriadCardResident: Codable {
    public let row_id: Int
    public let fields: TripleTriadCardResidentFields
}

public struct TripleTriadCardResidentFields: Codable {
//    public let Acquisition: //TODO
//    public let Location: //TODO
//    public let Quest: Quest //TODO: verify
//    public let AcquisitionType: TripleTriadCardObtain //TODO: add sheet TripleTriadCardObtain
    public let Order: Int
    public let Bottom: Int
    public let Left: Int
    public let Right: Int
    public let Top: Int
    public let SaleValue: Int //MGP
    public let SortKey: Int
    public let TripleTriadCardRarity: TripleTriadCardRarity
    public let TripleTriadCardType: TripleTriadCardType
}

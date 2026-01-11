import Foundation

public struct TripleTriad: Codable {
    public let row_id: Int
    public let fields: TripleTriadFields
}

public struct TripleTriadFields: Codable {
    public let Fee: Int
    public let ItemPossibleReward: [Item]
//    public let PreviousQuest: [Quest]
    public let TripleTriadCardFixed: [TripleTriadCard]
    public let TripleTriadCardVariable: [TripleTriadCard]
    public let TripleTriadRule: [TripleTriadRule]
}

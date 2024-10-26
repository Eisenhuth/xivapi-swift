import Foundation

public struct TripleTriad: Codable {
    public let row_id: Int
    public let fields: TripleTriadFields
}

public extension TripleTriad {
    var fee: Int { fields.Fee }
    var possibleRewards: [Item] { fields.ItemPossibleReward.filter { $0.row_id != 0 } }
    var cardFixed: [TripleTriadCard] { fields.TripleTriadCardFixed }
    var cardVariable: [TripleTriadCard] { fields.TripleTriadCardVariable }
    var rules: [TripleTriadRule] { fields.TripleTriadRule }
}

public struct TripleTriadFields: Codable {
    public let Fee: Int
    public let ItemPossibleReward: [Item]
//    public let PreviousQuest: [Quest]
    public let TripleTriadCardFixed: [TripleTriadCard]
    public let TripleTriadCardVariable: [TripleTriadCard]
    public let TripleTriadRule: [TripleTriadRule]
}

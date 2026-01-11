public extension TripleTriad {
    var fee: Int { fields.Fee }
    var possibleRewards: [Item] { fields.ItemPossibleReward.filter { $0.row_id != 0 } }
    var cardFixed: [TripleTriadCard] { fields.TripleTriadCardFixed }
    var cardVariable: [TripleTriadCard] { fields.TripleTriadCardVariable }
    var rules: [TripleTriadRule] { fields.TripleTriadRule }
}

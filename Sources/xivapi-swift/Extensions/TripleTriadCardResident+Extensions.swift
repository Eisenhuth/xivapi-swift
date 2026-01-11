public extension TripleTriadCardResident {
    var top: String { fields.Top == 10 ? "A" : fields.Top.description }
    var bottom: String { fields.Bottom == 10 ? "A" : fields.Bottom.description }
    var left: String { fields.Left == 10 ? "A" : fields.Left.description }
    var right: String { fields.Right == 10 ? "A" : fields.Right.description }
    var type: String { fields.TripleTriadCardType.name }
    var stars: Int { fields.TripleTriadCardRarity.fields.Stars }
}

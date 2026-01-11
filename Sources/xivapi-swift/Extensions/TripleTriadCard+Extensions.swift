public extension TripleTriadCard {
    
    var backgroundPath: String { "ui/uld/CardTripleTriad_hr1.tex" }
    
    var imagePath: String {
        
        let cardNumber = row_id.description
        let paddedString = String(repeating: "0", count: 3 - cardNumber.count).appending(cardNumber)
        let path = "ui/icon/087000/087\(paddedString)_hr1.tex"
        
        return path
    }
}

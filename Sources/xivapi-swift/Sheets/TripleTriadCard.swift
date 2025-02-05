import Foundation

public struct TripleTriadCard: Codable {
    public let row_id: Int
    public let fields: TripleTriadCardFields
}

public struct TripleTriadCardFields: Codable {
    public let Description: String
    public let Name: String
}

public extension TripleTriadCard {
    
    var backgroundPath: String { "ui/uld/CardTripleTriad_hr1.tex" }
    
    var imagePath: String {
        
        let cardNumber = row_id.description
        let paddedString = String(repeating: "0", count: 3 - cardNumber.count).appending(cardNumber)
        let path = "ui/icon/087000/087\(paddedString)_hr1.tex"
        
        return path
    }
}

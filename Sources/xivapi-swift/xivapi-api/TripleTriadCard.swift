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
    
    var backgroundUrl: URL? { Endpoint.asset(at: "ui/uld/CardTripleTriad_hr1.tex") }
    var imageUrl: URL? {
        
        let cardNumber = row_id
        let path = "ui/icon/087000/087\(cardNumber)_hr1.tex"
        let url = Endpoint.asset(at: path)
        
        return url
    }
    
    //TODO: stats, category
}

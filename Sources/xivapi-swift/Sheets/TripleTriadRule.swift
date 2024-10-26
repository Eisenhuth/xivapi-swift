import Foundation

public struct TripleTriadRule: Codable {
    public let row_id: Int
    public let fields: TripleTriadRuleFields
}

public struct TripleTriadRuleFields: Codable {
    public let Description: String
    public let Name: String
    
    //Unknown0, Unknown1, Unknown2, Unknown3 Int
    //Unknown4 Bool?
}

import Foundation

public struct GrandCompany: Codable {
    public let row_id: Int
    public let fields: GrandCompanyFields
}

public struct GrandCompanyFields: Codable {
    public let MonsterNote: ValueStruct
    public let Name: String
//    public let Unknown0: String
//    public let Unknown1: String
//    public let Unknown2: Int
//    public let Unknown3: Int
//    public let Unknown4: Int
//    public let Unknown5: Int
//    public let Unknown6: Int
//    public let Unknown7: Int
}

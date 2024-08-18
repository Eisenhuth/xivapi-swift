import Foundation

public struct ENpcResident: Codable {
    public let row_id: Int
    public let fields: ENpcResidentFields
}

public struct ENpcResidentFields: Codable {
    public let Map: Int
    public let Plural: String
    public let Singular: String
    public let Title: String
}

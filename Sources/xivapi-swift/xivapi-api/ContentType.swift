import Foundation

public struct ContentType: Codable {
    public let row_id: Int
    public let fields: ContentTypeFields
}

public struct ContentTypeFields: Codable {
    public let Icon: Icon
    public let IconDutyFinder: Icon
    public let Name: String
}

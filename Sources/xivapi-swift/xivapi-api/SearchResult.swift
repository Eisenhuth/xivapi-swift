import Foundation

public struct SearchResults: Codable {
    public var next: String?
    public var schema: String?
    public var results: [SearchResult]
}

public struct SearchResult: Codable, Hashable {
    public var score: Double
    public var sheet: String
    public var row_id: Int
    public var fields: SearchResultFields
}

public extension SearchResult {
    var icon: Icon { fields.Icon }
    var name: String { fields.Name }
}

public struct SearchResultFields: Codable, Hashable {
    public let Icon: Icon
    public let Name: String
}

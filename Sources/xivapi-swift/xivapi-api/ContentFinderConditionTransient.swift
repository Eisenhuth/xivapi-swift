import Foundation

public struct ContentFinderConditionTransient: Codable {
    public let row_id: Int?
    public let fields: ContentFinderConditionTransientFields
}

public struct ContentFinderConditionTransientFields: Codable {
    public let Description: String
}

import Foundation

public struct Title: Codable {
    public let row_id: Int
    public let fields: TitleFields
}

public struct TitleFields: Codable {
    public let Feminine: String
    public let IsPrefix: Bool
    public let Masculine: String
    public let Order: Int
}

import Foundation

public struct BGM: Codable {
    public let row_id: Int?
    public let fields: BGMFields?
}

public struct BGMFields: Codable {
    public let DisableRestart: Bool
    public let DisableRestartResetTime: Int
    public let File: String
    public let PassEnd: Bool
    public let Priority: Int
    public let SpecialMode: Int
}

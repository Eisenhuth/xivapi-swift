public struct Tomestones: Codable {
    public let row_id: Int
    public let fields: TomestonesFields
}

public struct TomestonesFields: Codable {
    public let WeeklyLimit: Int
}

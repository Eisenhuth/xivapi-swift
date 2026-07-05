public struct TomestonesItem: Codable {
    public let row_id: Int
    public let fields: TomestonesItemFields
}

public struct TomestonesItemFields: Codable {
    public let Item: Item
    public let Tomestones: Tomestones
}

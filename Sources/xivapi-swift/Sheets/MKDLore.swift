public struct MKDLore: Codable {
    public let fields: MKDLoreFields
}

public struct MKDLoreFields: Codable {
    public let Description: String
    public let Image: Icon
    public let Name: String
    public let UnlockLink: Int
}

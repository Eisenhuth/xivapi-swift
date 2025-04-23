import Foundation

public struct SecretRecipeBook: Codable {
    public let value: Int?
    public let row_id: Int?
    public let fields: SecretRecipeBookFields?
}

public struct SecretRecipeBookFields: Codable {
    public let Item: ItemMinimal
    public let Name: String
}



import Foundation

public struct SecretRecipeBook: Codable {
    public let value: Int
    public let sheet: String?
    public let row_id: Int?
    public let fields: SecretRecipeBookFields?
}

public struct SecretRecipeBookFields: Codable {
    public let Item: SecretRecipeBookItem //this should be replaced by Item at some point
    public let Name: String
}

public struct SecretRecipeBookItem: Codable {
    public let value: Int
    public let sheet: String?
    public let row_id: Int?
    
    public let fields: SecretRecipeBookItemFields
    
    public struct SecretRecipeBookItemFields: Codable {
        public let Icon: Icon
        public let Name: String
    }
}



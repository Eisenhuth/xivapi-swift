import Foundation

public struct ItemAction: Codable {
    public let fields: ItemActionFields
}

public struct ItemActionFields: Codable {
    public let Data: [Int]
    public let DataHQ: [Int]
    public let Action: ItemActionFieldsAction
    
    public struct ItemActionFieldsAction: Codable {
        public let value: Int
    }
}

import Foundation

public struct ItemSearchCategory: Codable {
    public let row_id: Int
    public let fields: ItemSearchCategoryFields
}

public struct ItemSearchCategoryFields: Codable {
    public let Category: Int
    //        public let ClassJob: ClassJob //TODO: work around recursion
    public let Icon: Icon
    public let Name: String
    public let Order: Int
}

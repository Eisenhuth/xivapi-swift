import Foundation

public struct JournalGenre: Codable {
    public let row_id: Int
    public let fields: JournalGenreFields
}

public struct JournalGenreFields: Codable {
    public let Icon: Icon
    public let JournalCategory: JournalCategory
    public let Name: String
//    public let Unknown0: Bool
}

public struct JournalCategory: Codable {
    public let row_id: Int
    public let fields: JournalCategoryFields
}

public struct JournalCategoryFields: Codable {
    //        public let DataType: Int
//    public let JournalSection: JournalSection?
    public let Name: String
    //        public let SeparateType: Int
}

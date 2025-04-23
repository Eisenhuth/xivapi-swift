import Foundation

public struct Achievement: Codable {
    public let row_id: Int
    public let fields: AchievementFields
}

public struct AchievementFields: Codable {
//    public let AchievementCategory: AchievementCategory
//    public let AchievementHideCondition: AchievementHideCondition
//    public let AchievementTarget: AchievementTarget
//    public let Data:
    public let Description: String
    public let Icon: Icon
    public let Item: Item
//    public let Key:
    public let Name: String
    public let Order: Int
    public let Points: Int
    public let Title: Title
//    public let Type: Int
}

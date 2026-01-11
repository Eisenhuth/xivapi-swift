import Foundation

public struct XivStatus: Codable {
    public let fields: StatusFields
}

public struct StatusFields: Codable {
    public let CanDispel: Bool
    public let CanStatusOff: Bool
    public let ClassJobCategory: ClassJobCategory
    public let Description: String
    public let Icon: Icon
//    public let MaxStacks: Int
    public let Name: String
    public let StatusCategory: Int
}

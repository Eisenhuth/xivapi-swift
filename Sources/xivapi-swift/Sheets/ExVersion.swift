import Foundation

public struct ExVersion: Codable {
    public let row_id: Int
    public let fields: ExVersionFields
}

public struct ExVersionFields: Codable {
//    public let AcceptJingle: ScreenImage
//    public let CompleteJingle: ScreenImage
    public let MenuScreen: Int
    public let Name: String
}

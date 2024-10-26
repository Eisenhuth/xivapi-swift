import Foundation

public struct InstanceContent: Codable {
    public let row_id: Int
    public let fields: InstanceContentFields
}

public struct InstanceContentFields: Codable {
    public let BGM: BGM
//    public let BNpcBaseBoss: BNpcBase
    //lots of TODO
}

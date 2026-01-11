import Foundation

public struct ItemFood: Codable {
    public let fields: ItemFoodFields
}

public struct ItemFoodFields: Codable {
    public let BaseParam: [BaseParam]
    public let EXPBonusPercent: Int
    public let IsRelative: [Bool]
    public let Max: [Int]
    public let MaxHQ: [Int]
    public let Value: [Int]
    public let ValueHQ: [Int]
}

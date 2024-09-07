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

public extension ItemFood {
    var bonusesNQ: [Stat] {
        
        var _stats = [Stat]()
        
        for i in 0...2 {
            let name = fields.BaseParam[i].fields.Name
            let value = fields.Max[i] != 0 ? fields.Max[i] : fields.Value[i]
            
            _stats.append(Stat(name: name, value: value))
        }
        
        return _stats.filter { $0.value != 0 }
    }
    
    var bonusesHQ: [Stat] {
        
        var _stats = [Stat]()
        
        for i in 0...2 {
            let name = fields.BaseParam[i].fields.Name
            let value = fields.MaxHQ[i] != 0 ? fields.MaxHQ[i] : fields.ValueHQ[i]
            
            _stats.append(Stat(name: name, value: value))
        }
        
        return _stats.filter { $0.value != 0 }
    }
}

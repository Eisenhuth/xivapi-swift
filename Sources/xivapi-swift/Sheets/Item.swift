import Foundation

public struct Item: Codable {
    public let schema: String?
    public let row_id: Int
    public let fields: ItemFields
}

/// intended to be used when you don't need all the additional data
public struct ItemMinimal: Codable {
    public let row_id: Int
    public let fields: ItemFieldsMinimal
    
    public var name: String { fields.Name }
    public var description: String { fields.Description }
    public var icon: Icon { fields.Icon }
}

public extension Item {
    var canBeHq: Bool { fields.CanBeHq }
    var cooldown: Int { fields.Cooldowns }
    var description: String { fields.Description }
    var icon: Icon { fields.Icon }
    var isAdvancedMeldingPermitted: Bool { fields.IsAdvancedMeldingPermitted }
    var isCollectable: Bool { fields.IsCollectable }
    var isCrestWorthy: Bool { fields.IsCrestWorthy }
//    var isDyeable: Bool { fields.IsDyeable }
    var isGlamorous: Bool { fields.IsGlamorous }
    var isIndisposable: Bool { fields.IsIndisposable }
    var isPvP: Bool { fields.IsPvP }
//    var isUnique: Bool { fields.IsUnique }
    var isUntradable: Bool { fields.IsUntradable }
    var isMarketable: Bool { fields.ItemSearchCategory.row_id > 0 }
    var levelEquip: Int { fields.LevelEquip }
    var levelItem: LevelItem { fields.LevelItem }
    var itemLevel: Int { levelItem.value }
    var name: String { fields.Name }
    /// sell to vendor
    var priceLow: Int { fields.PriceLow }
    /// buy from vendor
    var priceMid: Int { fields.PriceMid }
    var rarity: Int { fields.Rarity }
    var stackSize: Int { fields.StackSize }
    
    var itemUICategory: ItemUICategory { fields.ItemUICategory }
    var additionalData: AdditionalData? { fields.AdditionalData }
    var bonuses: [Stat] {
        
        var _stats = [Stat]()
        
        for i in 0..<fields.BaseParamValue.count {
            let name = fields.BaseParam[i].fields.Name
            let value = fields.BaseParamValue[i]
            
            _stats.append(Stat(name: name, value: value))
        }
        
        return _stats.filter { $0.value != 0 }
    }
    
    var itemFood: Int? {
        let itemAction = fields.ItemAction
        let consumables = [844, 845, 846]
        if consumables.contains(itemAction.fields.type){
            return itemAction.fields.Data[1] //ItemFood ID
        }
        
        return nil
    }
    
    var itemEffectNQ: String? {
        let itemAction = fields.ItemAction.fields
        
        switch itemAction.type {
        case 847:
            return "Restores up to \(itemAction.Data[0])% of HP (\(itemAction.Data[1]) points max)."
        case 848:
            return "Restores up to \(itemAction.Data[0])% of MP (\(itemAction.Data[1]) points max)."
        default:
            return nil
        }
    }
        
    var itemEffectHQ: String? {
        let itemAction = fields.ItemAction.fields
        
        switch itemAction.type {
        case 847:
            return "Restores up to \(itemAction.DataHQ[0])% of HP (\(itemAction.DataHQ[1]) points max)."
        case 848:
            return "Restores up to \(itemAction.DataHQ[0])% of MP (\(itemAction.DataHQ[1]) points max)."
        default:
            return nil
        }
    }
    
    var stats: Stats {
        .init(block: fields.Block, blockRate: fields.BlockRate, damageMag: fields.DamageMag, damagePhys: fields.DamagePhys, defenseMag: fields.DefenseMag, defensePhys: fields.DefensePhys, delayms: fields.Delayms)
    }
}

public struct ItemFields: Codable {
    public let AdditionalData: AdditionalData?
    public let CanBeHq: Bool
    public let BaseParam: [BaseParam]
    public let BaseParamValue: [Int]
    public let Block: Int
    public let BlockRate: Int
    public let ClassJobCategory: ClassJobCategory
    public let Cooldowns: Int
    public let DamageMag: Int
    public let DamagePhys: Int
    public let DefenseMag: Int
    public let DefensePhys: Int
    public let Delayms: Int
    public let Description: String
//    public let EquipSlotCategory: EquipSlotCategory
    public let Icon: Icon
    public let IsAdvancedMeldingPermitted: Bool
    public let IsCollectable: Bool
    public let IsCrestWorthy: Bool
//    public let IsDyeable: Bool
    public let IsGlamorous: Bool
    public let IsIndisposable: Bool
    public let IsPvP: Bool
//    public let IsUnique: Bool
    public let IsUntradable: Bool
    public let ItemAction: ItemAction
    public let ItemSearchCategory: ItemSearchCategory
    public let ItemUICategory: ItemUICategory
    public let LevelEquip: Int
    public let LevelItem: LevelItem
    public let Lot: Bool
    public let Name: String
    public let PriceLow: Int
    public let PriceMid: Int
    public let Rarity: Int
    public let StackSize: Int
}

public struct ItemFieldsMinimal: Codable {
    public let Name: String
    public let Description: String
    public let Icon: Icon
}

public struct AdditionalData: Codable {
    public let value: Int?
    public let sheet: String?
    public let row_id: Int?
    public let fields: AdditionalDataFields?
    
    public struct AdditionalDataFields: Codable {
        public let Description: String?
        public let Name: String?
    }
}

public struct Stat {
    public let name: String
    public let value: Int
}

public struct Stats {
    public let block: Int
    public let blockRate: Int
    public let damageMag: Int
    public let damagePhys: Int
    public let defenseMag: Int
    public let defensePhys: Int
    public let delayms: Int
}



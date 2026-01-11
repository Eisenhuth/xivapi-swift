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

public struct ItemFields: Codable {
    public let AdditionalData: AdditionalData?
    public let CanBeHq: Bool
    public let BaseParam: [BaseParam]
    public let BaseParamSpecial: [BaseParam]
    public let BaseParamModifier: Int
    public let BaseParamValue: [Int]
    public let BaseParamValueSpecial: [Int]
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
    public let FilterGroup: Int
    public let GrandCompany: GrandCompany
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
    public let ItemSeries: ItemSeries
//    public let ItemSortCategory: ItemSortCategory?
    public let ItemSpecialBonus: ItemSpecialBonus
//    public let ItemSpecialBonusParam
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
    
    public init(block: Int, blockRate: Int, damageMag: Int, damagePhys: Int, defenseMag: Int, defensePhys: Int, delayms: Int) {
        self.block = block
        self.blockRate = blockRate
        self.damageMag = damageMag
        self.damagePhys = damagePhys
        self.defenseMag = defenseMag
        self.defensePhys = defensePhys
        self.delayms = delayms
    }
}



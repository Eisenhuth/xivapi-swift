import Foundation

public struct Item: Codable {
    public let schema: String
    public let row_id: Int
    public let fields: ItemFields
}

public extension Item {
    var canBeHq: Bool { fields.CanBeHq }
    var cooldown: Int { fields.Cooldowns }
    var description: String { fields.Description }
    var icon: Icon { fields.Icon }
    var isAdvancedMeldingPermitted: Bool { fields.IsAdvancedMeldingPermitted }
    var isCollectable: Bool { fields.IsCollectable }
    var isCrestWorthy: Bool { fields.IsCrestWorthy }
    var isDyeable: Bool { fields.IsDyeable }
    var isGlamorous: Bool { fields.IsGlamorous }
    var isIndisposable: Bool { fields.IsIndisposable }
    var isPvP: Bool { fields.IsPvP }
    var isUnique: Bool { fields.IsUnique }
    var isUntradable: Bool { fields.IsUntradable }
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
}


public struct ItemFields: Codable {
    public let CanBeHq: Bool
//    public let ClassJobCategory: ClassJobCategory
    public let Cooldowns: Int
    public let Description: String
//    public let EquipSlotCategory: EquipSlotCategory
    public let Icon: Icon
    public let IsAdvancedMeldingPermitted: Bool
    public let IsCollectable: Bool
    public let IsCrestWorthy: Bool
    public let IsDyeable: Bool
    public let IsGlamorous: Bool
    public let IsIndisposable: Bool
    public let IsPvP: Bool
    public let IsUnique: Bool
    public let IsUntradable: Bool
//    public let ItemSearchCategory: ItemSearchCategory
//    public let ItemUICategory: ItemUICategory
    public let LevelEquip: Int
    public let LevelItem: LevelItem
    public let Name: String
    public let PriceLow: Int
    public let PriceMid: Int
    public let Rarity: Int
    public let StackSize: Int
}





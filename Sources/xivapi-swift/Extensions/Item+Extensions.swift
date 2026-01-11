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
    var bonuses: [Stat] { getStats(from: fields.BaseParam, with: fields.BaseParamValue) }
    var bonusesSpecial: [Stat] { getStats(from: fields.BaseParamSpecial, with: fields.BaseParamValueSpecial) }
    
    func getStats(from baseParams: [BaseParam], with values: [Int]) -> [Stat] {
        var _stats = [Stat]()
        
        for i in 0..<baseParams.count {
            let name = baseParams[i].fields.Name
            let value = values[i]
            
            _stats.append(Stat(name: name, value: value))
        }
        
        return _stats.filter { $0.value != 0 }
    }
    
    var itemFood: Int? {
        let itemAction = fields.ItemAction
        let consumables = [844, 845, 846]
        if consumables.contains(itemAction.fields.Action.value){
            return itemAction.fields.Data[1] //ItemFood ID
        }
        
        return nil
    }
    
    var itemEffectNQ: String? {
        let itemAction = fields.ItemAction.fields
        
        switch itemAction.Action.value {
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
        
        switch itemAction.Action.value {
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
    
    var vendorSellPrice: Int { calculateVendorSellPrice(self) }
}

//IDA take the wheel, thanks Critical
func calculateVendorSellPrice(_ item: Item) -> Int {
    
    //Materia
    if item.fields.FilterGroup == 13 {
        return (11 * item.priceLow + 9) / 10;
    }
    
    return item.priceLow
}

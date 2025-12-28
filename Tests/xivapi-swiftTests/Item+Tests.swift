import Foundation
import Testing
import xivapi_swift

@Suite("Item")
struct Item_Tests {
    let xivapi = xivapiClient(automaticallyPin: true)

    @Test("Item: Tincture") func ItemTincture() async throws {
        let item = try #require(await xivapi.getItem(44162)) //Item: Grade 2 Gemdraught of Strength

        #expect(item.fields.Name == "Grade 2 Gemdraught of Strength")
        #expect(item.fields.LevelItem.value == 710)
        
        #expect(item.canBeHq == true)
        #expect(item.cooldown == 300)
        #expect(item.description == "This diluted brew temporarily increases strength for twice the duration of similar potions.\n\nDuration: 30s")
        #expect(xivapi.assetUrl(at: item.icon.path ?? "", format: .jpg).description ==  "\(xivapi.baseUrl)/asset?path=ui/icon/020000/020710.tex&format=jpg&version=\(xivapi.version!)")
        #expect(xivapi.assetUrl(at: item.icon.path_hr1 ?? "", format: .jpg).description == "\(xivapi.baseUrl)/asset?path=ui/icon/020000/020710_hr1.tex&format=jpg&version=\(xivapi.version!)")
        
        #expect(item.levelEquip == 1)
        #expect(item.itemLevel == 710)
        
        #expect(item.isAdvancedMeldingPermitted == false)
        #expect(item.isCollectable == false)
        #expect(item.isCrestWorthy == false)
        #expect(item.isGlamorous == false)
        #expect(item.isIndisposable == false)
        #expect(item.isPvP == false)
        #expect(item.isUntradable == false)
        #expect(item.isMarketable == true)
        
        #expect(item.name == "Grade 2 Gemdraught of Strength")
        #expect(item.priceLow == 95)
        #expect(item.priceMid == 99999)
        #expect(item.rarity == 1)
        
        #expect(item.stackSize == 999)
        
        #expect(item.itemUICategory.fields?.Name == "Medicine")
        #expect(item.additionalData?.sheet == nil)
        #expect(item.bonuses.isEmpty == true)
        #expect(item.itemFood == 662)
        #expect(item.fields.ItemAction.fields.Action.value == 846)
        #expect(item.itemEffectNQ == nil)
        #expect(item.itemEffectHQ == nil)
        
    }
    
    @Test("Item: MP Potion") func ItemEther() async throws {
        let item = try #require(await xivapi.getItem(23168)) //Item: Super-Ether
        
        #expect(item.itemFood == nil)
        #expect(item.itemEffectNQ?.isEmpty == false)
        #expect(item.itemEffectHQ?.isEmpty == false)
    }
    
    @Test("Item: HP Potion") func ItemPotion() async throws {
        let item = try #require(await xivapi.getItem(38956))
        
        #expect(item.itemFood == nil)
        #expect(item.itemEffectNQ?.isEmpty == false)
        #expect(item.itemEffectHQ?.isEmpty == false)
    }
    
    @Test("Item: Weapon") func ItemWeapon() async throws {
        let item = try #require(await xivapi.getItem(36949)) //Ultimate Claymore of the Heavens
        
        #expect(item.stats.damagePhys == 120)
        #expect(item.isMarketable == false)
    }
    
    @Test("Item: Food") func ItemFood() async throws {
        let item = try #require(await xivapi.getItem(44175)) //Roast Chicken
        let foodId = try #require(item.itemFood)
        let food = try #require(await xivapi.getSheet(.ItemFood, id: foodId) as ItemFood?)
        
        #expect(food.bonusesNQ.first?.value == 105)
        #expect(food.bonusesHQ.first?.value == 132)
    }
    
    @Test("Item: Spiritbond") func ItemFood2() async throws {
        let item = try #require(await xivapi.getItem(27960)) //Superior Spiritbond Potion
        let foodId = try #require(item.itemFood)
        let food = try #require(await xivapi.getSheet(.ItemFood, id: foodId) as ItemFood?)
        
        #expect(food.bonusesNQ.first?.value == 5)
        #expect(food.bonusesHQ.first?.value == 6)
    }
    
    @Test("Item: Furniture") func ItemFurniture() async throws {
        let item = try #require(await xivapi.getItem(44889))
        
        #expect(item.name == "Origenics Monitor Desk")
    }
    
    @Test("Item: Occult Crescent") func ItemArcanaut() async throws {
        let item = try #require(await xivapi.getItem(47770))
        
        #expect(item.bonuses.contains(where: { $0.name == "Strength"  && $0.value == 403}))
        #expect(item.bonusesSpecial.contains(where: { $0.name == "Special Attribute"  && $0.value == 3}))
        #expect(item.fields.ItemSpecialBonus.fields.Name == "Occult Crescent Effect:")
        #expect(item.fields.ItemSeries.fields.Name == "")
    }
    
    @Test("Item: Eureka") func ItemElemental() async throws {
        let item = try #require(await xivapi.getItem(24759))
        
        #expect(item.bonuses.contains(where: { $0.name == "Strength"  && $0.value == 139}))
        #expect(item.bonusesSpecial.contains(where: { $0.name == "Elemental Bonus"  && $0.value == 131}))
        #expect(item.fields.ItemSpecialBonus.fields.Name == "Eureka Effect: ")
        #expect(item.fields.ItemSeries.fields.Name == "")
    }
    
    @Test("Item: Handsaint Set") func ItemHandsaint() async throws {
        let item = try #require(await xivapi.getItem(31807))
        
        #expect(item.fields.ItemSpecialBonus.fields.Name == "Set Bonus: ")
        #expect(item.fields.ItemSeries.fields.Name == "Handsaint Accessories")
    }
    
    @Test func ItemMinimal() async throws {
        let item = try #require(await xivapi.getItemMinimal(44162))
        
        #expect(item.name == "Grade 2 Gemdraught of Strength")
        #expect(item.description.isEmpty == false)
        #expect(item.icon.path != nil)
    }
    
    @Test func ItemVendorSellPrices() async throws {
        let platinum = try #require(await xivapi.getItem(5827))
        let materia = try #require(await xivapi.getItem(41771))
        
        #expect(platinum.priceLow == 10_000)
        #expect(platinum.vendorSellPrice == 10_000)
        
        #expect(materia.priceLow == 197)
        #expect(materia.vendorSellPrice == 217)
    }
    
    @Test func ItemAction() async throws {
        let itemAction = try #require(await xivapi.getSheet(.ItemAction, id: 1732) as ItemAction?)
        
        #expect(itemAction.fields.Action.value == 846)
        #expect(itemAction.fields.Data == [49, 603, 30, 0, 0, 0, 0, 0, 0])
        #expect(itemAction.fields.DataHQ == [49, 603, 30, 0, 0, 0, 0, 0, 0])
    }
}

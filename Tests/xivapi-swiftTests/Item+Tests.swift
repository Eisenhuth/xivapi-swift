import Foundation
import Testing
import xivapi_swift

@Suite("Item")
struct Item_Tests {
    let xivapi = xivapiClient()

    @Test("Item: Tincture") func ItemTincture() async throws {
        let item = try #require(await xivapi.getItem(44162)) //Item: Grade 2 Gemdraught of Strength

        try #require(item != nil)
        #expect(item.fields.Name == "Grade 2 Gemdraught of Strength")
        #expect(item.fields.LevelItem.value == 710)
        
        #expect(item.canBeHq == true)
        #expect(item.cooldown == 300)
        #expect(item.description == "This diluted brew temporarily increases strength for twice the duration of similar potions.\n\nDuration: 30s")
        #expect(xivapi.assetUrl(at: item.icon.path ?? "", format: .jpg).description ==  "\(xivapi.baseUrl)/asset?path=ui/icon/020000/020710.tex&format=jpg")
        #expect(xivapi.assetUrl(at: item.icon.path_hr1 ?? "", format: .jpg).description == "\(xivapi.baseUrl)/asset?path=ui/icon/020000/020710_hr1.tex&format=jpg")
        
        #expect(item.levelEquip == 1)
        #expect(item.itemLevel == 710)
        
        #expect(item.isAdvancedMeldingPermitted == false)
        #expect(item.isCollectable == false)
        #expect(item.isCrestWorthy == false)
        #expect(item.isGlamorous == false)
        #expect(item.isIndisposable == false)
        #expect(item.isPvP == false)
        #expect(item.isUntradable == false)
        
        #expect(item.name == "Grade 2 Gemdraught of Strength")
        #expect(item.priceLow == 95)
        #expect(item.priceMid == 99999)
        #expect(item.rarity == 1)
        
        #expect(item.stackSize == 999)
        
        #expect(item.itemUICategory.fields?.Name == "Medicine")
        #expect(item.additionalData?.sheet == nil)
        #expect(item.bonuses.isEmpty == true)
        #expect(item.itemFood != nil)
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
        let item = try #require(await xivapi.getItem(36949))
        
        #expect(item.stats.damagePhys == 120)
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
    
    @Test func ItemMinimal() async throws {
        let item = try #require(await xivapi.getItemMinimal(44162))
        
        #expect(item.name == "Grade 2 Gemdraught of Strength")
        #expect(item.description.isEmpty == false)
        #expect(item.icon.path != nil)
    }
}

import Testing
import xivapi_swift

@Suite("SpecialShop")
struct SpecialShop_Tests {
    let xivapi = xivapiClient(automaticallyPin: true)
    
    @Test("Seasonal Event") func SpecialShop() async throws {
        let shop = try #require(await xivapi.getSheet(.SpecialShop, id: 1769473) as SpecialShop?)
        
        #expect(shop.fields.Name == "Seasonal Event")
        #expect(shop.fields.Item[0].Item[0].name == "Snowflake Peak")
    }
    
    @Test("Kefka Weapons") func KefkaShop() async throws {
        let shop = try #require(await xivapi.getSheet(.SpecialShop, id: 1771039) as SpecialShop?)
        
        #expect(shop.fields.Name == "Totem Gear (Kefka)")
        #expect(shop.fields.Item[0].Item[0].name == "Palazzo Diamond Sword")
        #expect(shop.fields.Item[0].ItemCost[0].name == "Mad Harlequin's Totem")
        #expect(shop.fields.UseCurrencyType == 2)
    }
    
    @Test("Poetics - iL 660 Weapons") func PoeticsShop() async throws {
        let shop = try #require(await xivapi.getSheet(.SpecialShop, id: 1770699) as SpecialShop?)
        
        #expect(shop.fields.Name == "Allagan Tomestones of Poetics (IL 660 Weapons)")
        #expect(shop.fields.UseCurrencyType == 4)
        #expect(shop.fields.Item[0].CostType == [2, 0, 0])
        #expect(shop.fields.Item[0].CurrencyCost == [430, 0, 0])
    }
    
}

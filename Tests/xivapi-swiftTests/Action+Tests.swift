import Testing
import xivapi_swift

@Suite("Action")
struct Action_Tests {
    let xivapi = xivapiClient(automaticallyPin: true)
    
    @Test("Blue Mage") func AozAction() async throws {
        let action = try #require(await xivapi.getSheet(.AozAction, id: 104) as AozAction?)
        
        #expect(action.name == "Nightbloom")
        #expect(action.number == 104)
        #expect(action.category.name == "Ability")
        #expect(action.actionIcon.id == 3357)
        #expect(action.transientIcon.id == 72305)
        #expect(action.description == "This extravagant technique belongs to Tsukuyomi, Lady of the Moon, whose malignant ire manifests as a field of flowers which then burst apart in a hail of deadly petals. Accept the inevitability of the grave, and the power of the nightbloom is yours to wield...")
    }
    
    @Test("PvE: TBN") func Action() async throws {
        let action = try #require(await xivapi.getAction(7393))
        
        #expect(action.name == "The Blackest Night")
    }
    
    @Test("PvP: TBN") func PvPAction() async throws {
        let action = try #require(await xivapi.getAction(29093))
        
        #expect(action.name == "the Blackest Night")
    }
    
    @Test("PvP: Glory Slash") func PvPAction2() async throws {
        let action = try #require(await xivapi.getPvPAction(2))
        
        #expect(action.action.name == "Glory Slash")
    }

}

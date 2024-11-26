import Testing
import xivapi_swift

@Suite("Trait")
struct Trait_Tests {
    let xivapi = xivapiClient()
    
    @Test("Enhanced Unmend") func Trait() async throws {
        let trait = try #require(await xivapi.getTrait(422))
        
        #expect(trait.name == "Enhanced Unmend")
        #expect(trait.level == 84)
        #expect(trait.icon.id == 6064)
    }

}

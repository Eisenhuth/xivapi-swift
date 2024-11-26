import Testing
import xivapi_swift

@Suite("Status")
struct Status_Tests {
    let xivapi = xivapiClient()
    
    @Test("Stun") func Status() async throws {
        let status = try #require(await xivapi.getStatus(2))
        
        #expect(status.name == "Stun")
        #expect(status.description == "Unable to execute actions.")
        #expect(status.icon.id == 215004)
    }

}

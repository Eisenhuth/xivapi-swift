import Testing
import xivapi_swift

@Suite("Map")
struct Map_Tests {
    let xivapi = xivapiClient()
    
    @Test("Map: Thavnair") func Map() async throws {
        let map = try #require(await xivapi.getMap(696))
        
        #expect(map.name == "Thavnair")
        #expect(map.compositedMapUrl != nil)
        #expect(map.region == "Ilsabard")
        #expect(map.mapUrl(format: .jpg) != nil)
    }

}

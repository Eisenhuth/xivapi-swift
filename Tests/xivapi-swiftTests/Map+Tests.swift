import Testing
import xivapi_swift

@Suite("Map")
struct Map_Tests {
    let xivapi = xivapiClient()
    
    @Test("Map: Thavnair") func Map() async throws {
        let map = try #require(await xivapi.getMap(696))
        
        #expect(map.name == "Thavnair")
        #expect(map.compositedMapUrl?.description == "\(xivapi.baseUrl)/asset/map/m5f1/00?format=jpg")
        #expect(map.region == "Ilsabard")
        #expect(map.mapUrl(format: .jpg)?.description == "\(xivapi.baseUrl)/asset?path=ui/map/m5f1/00/m5f100_m.tex&format=jpg")
    }

}

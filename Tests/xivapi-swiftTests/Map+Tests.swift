import Testing
import xivapi_swift

@Suite("Map")
struct Map_Tests {
    let xivapi = xivapiClient()
    
    @Test("Map: Thavnair") func Map() async throws {
        let map = try #require(await xivapi.getMap(696))
        
        #expect(map.name == "Thavnair")
        let compositedMapPath = xivapi.compositedAssetUrl(at: map.compositedMapPath, format: .jpg)
        #expect(compositedMapPath.description == "\(xivapi.baseUrl)/asset/map/m5f1/00?format=jpg")
        #expect(map.region == "Ilsabard")
        let mapPath = xivapi.assetUrl(at: map.mapPath, format: .jpg)
        #expect(mapPath.description == "\(xivapi.baseUrl)/asset?path=ui/map/m5f1/00/m5f100_m.tex&format=jpg")
    }

}

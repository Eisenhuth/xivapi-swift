import Testing
import xivapi_swift

@Suite("Map")
struct Map_Tests {
    let xivapi = xivapiClient(automaticallyPin: true)
    
    @Test("Map: Thavnair") func Map() async throws {
        let map = try #require(await xivapi.getMap(696))
        
        #expect(map.name == "Thavnair")
        #expect(map.region == "Ilsabard")
        
        [Format.jpg, .png, .webp].forEach { format in
            let mapPath = xivapi.assetUrl(at: map.mapPath, format: format)
            #expect(mapPath.description == "\(xivapi.baseUrl)/asset?path=ui/map/m5f1/00/m5f100_m.tex&format=\(format.rawValue)&version=\(xivapi.version!)")
            print("mapPath assetUrl: \(mapPath)")
            
            let compositedMapPath = xivapi.compositedAssetUrl(at: map.compositedMapPath, format: format)
            #expect(compositedMapPath.description == "\(xivapi.baseUrl)/asset/map/m5f1/00?format=\(format.rawValue)&version=\(xivapi.version!)")
            print("mapPath composited: \(compositedMapPath)")
        }
    }

}

import Testing
import xivapi_swift

@Suite("ContentFinderCondition")
struct ContentFinderCondition_Tests {
    let xivapi = xivapiClient(automaticallyPin: true)
    
    @Test("Dungeon") func ContentFinderCondition() async throws {
        let dungeon = try #require(await xivapi.getSheet(.ContentFinderCondition, id: 1) as ContentFinderCondition?)
        
        #expect(dungeon.name == "the Thousand Maws of Toto–Rak")
        #expect(dungeon.contentType.fields.Name == "Dungeons")
        #expect(dungeon.description == "Named after a man-eating creature from Padjali folklore, the Thousand Maws of Toto-Rak was built on the site of a natural cave system beneath Silent Arbor. Until recently, it held all of Gridania's foulest criminals, from arsonists to poachers, but the completion of a new gaol closer to the city heralded its abandonment.")
        #expect(dungeon.image.id == 112005)
    }

}

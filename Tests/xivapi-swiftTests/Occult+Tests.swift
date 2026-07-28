import Foundation
import Testing
import xivapi_swift

@Suite("Occult Crescent")
struct Occult_Tests {
    let xivapi = xivapiClient(automaticallyPin: true)
    
    @Test("Trait") func TestTrait() async throws {
        let sheet = try #require(await xivapi.getSheet(.MKDTrait, id: 1) as MKDTrait?)
        #expect(sheet.fields.Name == "Enhanced Phantom Guard")
        #expect(sheet.fields.MKDSupportJob.fields.Name == "Phantom Knight")
    }
    
    @Test("Support Job") func TestSupportJob() async throws {
        let sheet = try #require(await xivapi.getSheet(.MKDSupportJob, id: 11) as MKDSupportJob?)
        #expect(sheet.fields.Name == "Phantom Oracle")
    }
    
    @Test("Lore") func TestLore() async throws {
        let sheet = try #require(await xivapi.getSheet(.MKDLore, id: 3) as MKDLore?)
        #expect(sheet.fields.Name == "The Archive")
    }
    
    @Test("Decode Lore Sheet") func TestSheet() async throws {
        let loreQuery = URLQueryItem(name: "fields", value: "Image,Name,Description,UnlockLink")
        let sheet = try #require(await xivapi.getSheet(.MKDLore, queryItems: [loreQuery]) as [MKDLore]?)
        
        #expect(sheet.count(where: { !$0.fields.Name.isEmpty }) >= 31)
    }
}

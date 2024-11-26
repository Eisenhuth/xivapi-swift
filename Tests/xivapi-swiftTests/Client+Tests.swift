import Testing
import Foundation
import xivapi_swift

@Suite("Client")
struct Client_Tests {
    let xivapi = xivapiClient()
    
    //MARK: commonly used
    @Test("Search: Name (Recipe/Item)") func TestSearch() async throws {
        let searchResults = try #require(await xivapi.search([.Recipe, .Item], name: "Grade 2"))
        #expect(searchResults.results.count > 0)
        #expect(searchResults.results.first?.icon != nil)
        #expect(searchResults.results.first?.name != nil)
    }
    
    @Test("Search: iLvl (Recipe/Item)") func TestSearch2() async throws {
        let searchResults = try #require(await xivapi.search([.Recipe, .Item], customQueries: [URLQueryItem(name: "query", value: "LevelItem>=600")]))
        #expect(searchResults.results.count > 0)
        #expect(searchResults.results.first?.icon != nil)
        #expect(searchResults.results.first?.name != nil)
    }
    
    @Test("URLs") func TestURLs() async throws {
        let searchUrl1 = xivapi.searchUrl([.Item, .Recipe], name: "Grade 2", next: nil)
        let searchUrl2 = xivapi.searchUrl([.Recipe], customQueries: [URLQueryItem(name: "query", value: "ItemResult=39727")], next: nil)
        let searchUrl3 = xivapi.searchUrl([.Item, .Recipe], customQueries: [URLQueryItem(name: "query", value: "LevelItem>=600")], next: nil)
        
        let assetUrl = xivapi.assetUrl(at: "ui/icon/030000/030639_hr1.tex", format: .png)
        
        #expect(searchUrl1 != nil)
        #expect(searchUrl2 != nil)
        #expect(searchUrl3 != nil)
        #expect(assetUrl != nil)
    }
    
    @Test("Decode Item") func DecodeItem() async throws {
        let item = try #require(await xivapi.getItem(44162))
        #expect(item.name == "Grade 2 Gemdraught of Strength")
    }
    
    @Test("Decode ItemMinimal") func DecodeItemMinimal() async throws {
        let itemMinimal = try #require(await xivapi.getItemMinimal(44162))
        #expect(itemMinimal.name == "Grade 2 Gemdraught of Strength")
    }
    
    @Test("Decode Recipe") func DecodeRecipe() async throws {
        let recipe = try #require(await xivapi.getRecipe(35585))
        #expect(recipe.itemResult.row_id == 39727)
    }
    
    @Test("Decode Map") func DecodeMap() async throws {
        let map = try #require(await xivapi.getMap(696))
        #expect(map.name == "Thavnair")
    }
    
    @Test("Decode Trait") func DecodeTrait() async throws {
        let trait = try #require(await xivapi.getTrait(422))
        #expect(trait.name == "Enhanced Unmend")
    }
    
    @Test("Decode Action") func DecodeAction() async throws {
        let action = try #require(await xivapi.getAction(7393))
        #expect(action.name == "The Blackest Night")
    }
    
    //MARK: other sheets
    @Test("Decode AozAction") func DecodeAozAction() async throws { #expect(await xivapi.getSheet(.AozAction, id: 2) as AozAction? != nil) }
    @Test("Decode BGM") func DecodeBGM() async throws { #expect(await xivapi.getSheet(.BGM, id: 50) as BGM? != nil) }
    @Test("Decode ClassJob") func DecodeClassJob() async throws { #expect(await xivapi.getSheet(.ClassJob, id: 1) as ClassJob? != nil) }
    @Test("Decode ContentFinderCondition") func DecodeContentFinderCondition() async throws { #expect(await xivapi.getSheet(.ContentFinderCondition, id: 1) as ContentFinderCondition? != nil) }
    @Test("Decode ENpcResident") func DecodeENpcResident() async throws { #expect(await xivapi.getSheet(.ENpcResident, id: 1005634) as ENpcResident? != nil) }
    @Test("Decode InstanceContent") func DecodeInstanceContent() async throws { #expect(await xivapi.getSheet(.InstanceContent, id: 1) as InstanceContent? != nil) }
    @Test("Decode PvPAction") func DecodePvPAction() async throws { #expect(await xivapi.getSheet(.PvPAction, id: 1) as PvPAction? != nil) }
    @Test("Decode Quest") func DecodeQuest() async throws { #expect(await xivapi.getSheet(.Quest, id: 65973) as Quest? != nil) }
    @Test("Decode Status") func DecodeStatus() async throws { #expect(await xivapi.getSheet(.Status, id: 1) as XivStatus? != nil) }
    @Test("Decode Town") func DecodeTown() async throws { #expect(await xivapi.getSheet(.Town, id: 1) as Town? != nil) }
    @Test("Decode TripleTriadCard") func DecodeTripleTriadCard() async throws { #expect(await xivapi.getSheet(.TripleTriadCard, id: 346) as TripleTriadCard? != nil) }
    
    
}
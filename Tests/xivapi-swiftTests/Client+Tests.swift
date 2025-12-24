import Testing
import Foundation
import xivapi_swift

@Suite("Client")
struct Client_Tests {
    let xivapi = xivapiClient()
    let xivapiPinned = xivapiClient(automaticallyPin: true)
    
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
        
        #expect(searchUrl1.description == "\(xivapi.baseUrl)/search?sheets=Item,Recipe&query=Name~%22Grade%202%22")
        #expect(searchUrl2.description == "\(xivapi.baseUrl)/search?sheets=Recipe&query=ItemResult%3D39727")
        #expect(searchUrl3.description == "\(xivapi.baseUrl)/search?sheets=Item,Recipe&query=LevelItem%3E%3D600")
        #expect(assetUrl.description == "\(xivapi.baseUrl)/asset?path=ui/icon/030000/030639_hr1.tex&format=png")
    }
    
    @Test("Decode Item") func DecodeItem() async throws {
        let item = try #require(await xivapiPinned.getItem(44162))
        #expect(item.name == "Grade 2 Gemdraught of Strength")
    }
    
    @Test("Decode Item /w Version & Schema") func DecodeItem2() async throws {
        let item = try #require(await xivapiPinned.getItem(44162))
        #expect(item.name == "Grade 2 Gemdraught of Strength")
    }
    
    @Test("Decode Item /w named Sheet") func DecodeItem3() async throws {
        let item = try #require(await xivapiPinned.getSheet(name: "Item", id: 44162) as Item?)
        #expect(item.name == "Grade 2 Gemdraught of Strength")
    }
    
    @Test("Decode ItemMinimal") func DecodeItemMinimal() async throws {
        let itemMinimal = try #require(await xivapi.getItemMinimal(44162))
        #expect(itemMinimal.name == "Grade 2 Gemdraught of Strength")
    }
    
    @Test("Decode Multiple Items") func DecodeMultipleItems() async throws {
        let itemIds = [39727, 44162, 44178, 44175]
        let multipleItems = try #require(await xivapi.getSheetRows(.Item, rows: itemIds, queryItems: [URLQueryItem(name: "fields", value: "Name,Description,Icon")]) as [ItemMinimal]?)
        #expect(multipleItems.count == itemIds.count)
        
        let names = multipleItems.map { $0.fields.Name }
        #expect(names.contains("Grade 2 Gemdraught of Strength"))
        #expect(names.contains("Grade 8 Tincture of Strength"))
        #expect(names.contains("Moqueca"))
        #expect(names.contains("Roast Chicken"))
    }
    
    @Test("Decode Recipe") func DecodeRecipe() async throws {
        let recipe = try #require(await xivapiPinned.getRecipe(35585))
        #expect(recipe.itemResult.row_id == 39727)
    }
    
    @Test("Decode Map") func DecodeMap() async throws {
        let map = try #require(await xivapiPinned.getMap(696))
        #expect(map.name == "Thavnair")
    }
    
    @Test("Decode Trait") func DecodeTrait() async throws {
        let trait = try #require(await xivapiPinned.getTrait(422))
        #expect(trait.name == "Enhanced Unmend")
    }
    
    @Test("Decode Action") func DecodeAction() async throws {
        let action = try #require(await xivapiPinned.getAction(7393))
        #expect(action.name == "The Blackest Night")
    }
    
    @Test("Decode Quest") func DecodeQuest() async throws {
        let quest = try #require (await xivapiPinned.getSheet(.Quest, id: 65973) as Quest?)
        #expect(quest.fields.Name == "Triple Triad Trial")
        #expect(quest.fields.IssuerStart.fields.Singular.capitalized == "Triple Triad Master")
        #expect(quest.fields.Reward.filter { $0.row_id != 0}.map { $0.row_id } == [9772, 9774, 9777, 9778, 9781])
    }

    @Test("Decode Stain") func DecodeStain() async throws {
        let stain = try #require (await xivapiPinned.getSheet(.Stain, id: 92) as Stain?)
        #expect(stain.Item1?.name == "Gunmetal Black Dye")
        #expect(stain.Item2?.row_id == 0)
    }
    
    //MARK: other sheets
    @Test("Decode AozAction") func DecodeAozAction() async throws { #expect(await xivapiPinned.getSheet(.AozAction, id: 2) as AozAction? != nil) }
    @Test("Decode BGM") func DecodeBGM() async throws { #expect(await xivapiPinned.getSheet(.BGM, id: 50) as BGM? != nil) }
    @Test("Decode ClassJob") func DecodeClassJob() async throws { #expect(await xivapiPinned.getSheet(.ClassJob, id: 1) as ClassJob? != nil) }
    @Test("Decode ContentFinderCondition") func DecodeContentFinderCondition() async throws { #expect(await xivapiPinned.getSheet(.ContentFinderCondition, id: 1) as ContentFinderCondition? != nil) }
    @Test("Decode ENpcResident") func DecodeENpcResident() async throws { #expect(await xivapiPinned.getSheet(.ENpcResident, id: 1005634) as ENpcResident? != nil) }
    @Test("Decode InstanceContent") func DecodeInstanceContent() async throws { #expect(await xivapiPinned.getSheet(.InstanceContent, id: 1) as InstanceContent? != nil) }
    @Test("Decode PvPAction") func DecodePvPAction() async throws { #expect(await xivapiPinned.getSheet(.PvPAction, id: 1) as PvPAction? != nil) }
    @Test("Decode Status") func DecodeStatus() async throws { #expect(await xivapiPinned.getSheet(.Status, id: 1) as XivStatus? != nil) }
    @Test("Decode Town") func DecodeTown() async throws { #expect(await xivapiPinned.getSheet(.Town, id: 1) as Town? != nil) }
    @Test("Decode TripleTriadCard") func DecodeTripleTriadCard() async throws { #expect(await xivapiPinned.getSheet(.TripleTriadCard, id: 346) as TripleTriadCard? != nil) }
    
    //MARK: others
    @Test("List Versions") func ListVersions() async throws {
        let versionsFull = try #require(await xivapi.listVersionsFull())
        let versions = try #require(await xivapi.listVersions())
        #expect(versionsFull.versionNames == versions)
        #expect(versionsFull.latestKey != nil)
        #expect(versionsFull.latestVersion != nil)
    }
    
    @Test("List Sheets") func ListSheets() async throws {
        let sheets = try #require(await xivapi.listSheets())
        #expect(sheets.count > 100)
    }
    
    @Test("Test Pin") func TestPin() async throws {
        #expect(xivapiPinned.version == verifiedVersion)
        #expect(xivapiPinned.schema == verifiedSchema)
        #expect(xivapi.version == nil)
        #expect(xivapi.schema == nil)
        #expect(xivapiPinned.assetUrl(at: "") != xivapi.assetUrl(at: "test"))
    }
    
    @Test("Test Schema") func TestSchema() async throws {
        #expect(await xivapi.getSchema() != nil)
        #expect(await xivapiPinned.getSchema() == xivapiPinned.schema)
    }
    
    @Test("Check Verified") func CheckVerified() async throws {
        let pinnedResponse = try #require(await xivapiPinned.getSchema())
        let unpinnnedResponse = try #require(await xivapi.getSchema())
        let latestVersion = try #require (await xivapi.listVersionsFull()?.latestVersion)
        
        #expect(pinnedResponse == unpinnnedResponse)
        #expect(xivapiPinned.version == latestVersion)
        #expect(xivapiPinned.schema == pinnedResponse)
    }
    
    @Test("Test Sheet List") func TestSheetList() async throws {
        let sheetsResponse = try #require(await xivapi.listSheets()?.filter ({ $0.contains("/") == false }))
        let clientSheets = Sheets.allCases.map { $0.rawValue }
        
        #expect(sheetsResponse == clientSheets)
    }
}

import Foundation
import Testing
import xivapi_swift

@Suite("Languages")
struct LanguagesTests {
    let client_en = xivapiClient(automaticallyPin: true, language: .en)
    let client_de = xivapiClient(automaticallyPin: true, language: .de)
    let client_fr = xivapiClient(automaticallyPin: true, language: .fr)
    let client_ja = xivapiClient(automaticallyPin: true, language: .ja)
    let client_default = xivapiClient(automaticallyPin: true)

    @Test("Item: Languages") func ItemLanguages() async throws {
        let en = try #require(await client_en.getItem(36949))
        let de = try #require(await client_de.getItem(36949))
        let fr = try #require(await client_fr.getItem(36949))
        let ja = try #require(await client_ja.getItem(36949))
        
        #expect(en.name == "Ultimate Claymore of the Heavens")
        #expect(de.name == "Ultimatives Claymore des Himmels")
        #expect(fr.name == "Claymore des cieux zêta")
        #expect(ja.name == "ヘヴンスクレイモア【絶】")
    }
    
    @Test("ItemMinimal: Languages") func ItemMinimalLanguages() async throws {
        let en = try #require(await client_en.getItemMinimal(36949))
        let de = try #require(await client_de.getItemMinimal(36949))
        let fr = try #require(await client_fr.getItemMinimal(36949))
        let ja = try #require(await client_ja.getItemMinimal(36949))
        
        #expect(en.name == "Ultimate Claymore of the Heavens")
        #expect(de.name == "Ultimatives Claymore des Himmels")
        #expect(fr.name == "Claymore des cieux zêta")
        #expect(ja.name == "ヘヴンスクレイモア【絶】")
    }
    
    @Test("Recipe: Languages") func RecipeLanguages() async throws {
        let en = try #require(await client_en.getRecipe(3762))
        let de = try #require(await client_de.getRecipe(3762))
        let fr = try #require(await client_fr.getRecipe(3762))
        let ja = try #require(await client_ja.getRecipe(3762))
        
        #expect(en.itemResult.name == "Super-Ether")
        #expect(de.itemResult.name == "Über-Äther")
        #expect(fr.itemResult.name == "Supra éther")
        #expect(ja.itemResult.name == "スーパーエーテル")
    }
    
    @Test("TripleTriadCard: Languages") func TripleTriadCardLanguages() async throws {
        let en: TripleTriadCard = try #require(await client_en.getSheet(.TripleTriadCard, id: 346))
        let de: TripleTriadCard = try #require(await client_de.getSheet(.TripleTriadCard, id: 346))
        let fr: TripleTriadCard = try #require(await client_fr.getSheet(.TripleTriadCard, id: 346))
        let ja: TripleTriadCard = try #require(await client_ja.getSheet(.TripleTriadCard, id: 346))

        #expect(en.fields.Name == "Zenos Galvus")
        #expect(de.fields.Name == "Zenos Galvus")
        #expect(fr.fields.Name == "Zenos Galvus")
        #expect(ja.fields.Name == "ゼノス・ガルヴァス")
    }
    
    @Test("Search: Languages") func SearchLanguages() async throws {
        let en = try #require(await client_en.search([.TripleTriadCard], name: "Zenos"))
        let de = try #require(await client_de.search([.TripleTriadCard], name: "Zenos"))
        let fr = try #require(await client_fr.search([.TripleTriadCard], name: "Zenos"))
        let ja = try #require(await client_ja.search([.TripleTriadCard], name: "ゼノス"))

        #expect(en.results.count > 1)
        #expect(de.results.count > 1)
        #expect(fr.results.count > 1)
        #expect(ja.results.count > 1)
    }
    
    @Test("NpcYell: Languages") func NpcYellLanguages() async throws {
        let multi = try #require(await client_default.getNpcYell(6492, languages: [.en, .de, .fr, .ja]))
        let en = try #require(await client_en.getNpcYell(6492))
        let de = try #require(await client_de.getNpcYell(6492))
        let fr = try #require(await client_fr.getNpcYell(6492))
        let ja = try #require(await client_ja.getNpcYell(6492))

        #expect(multi.Text_en == en.Text)
        #expect(multi.Text_de == de.Text)
        #expect(multi.Text_fr == fr.Text)
        #expect(multi.Text_ja == ja.Text)
    }
}

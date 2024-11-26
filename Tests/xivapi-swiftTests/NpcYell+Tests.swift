import Testing
import xivapi_swift

@Suite("NpcYell")
struct NpcYell_Tests {
    let xivapi = xivapiClient()
 
    @Test func NpcYell() async throws {
        let quote = try #require(await xivapi.getNpcYell(6492, languages: [.en, .de, .fr, .ja]))
        
        //UCOB - Phase 2 - Nael: In -> Out
        let expectedEn = "O hallowed moon,\nshine you the iron path!"
        let expectedDe = "O roter Mond! Führe mich zur Herrschaft! "
        let expectedFr = "Ô lune ! Éclaire la voie de la domination !"
        let expectedJa = "月よ！\n鉄の覇道を照らせ！"
        
        
        #expect(quote.Text_en == expectedEn)
        #expect(quote.Text_de == expectedDe)
        #expect(quote.Text_fr == expectedFr)
        #expect(quote.Text_ja == expectedJa)
        
        #expect(quote.Text == expectedEn)
        #expect(quote.Text_chs == nil)
        #expect(quote.Text_kr == nil)
    }
    
    @Test func NpcYell2() async throws { #expect(await xivapi.getNpcYell(6492) != nil) }

}

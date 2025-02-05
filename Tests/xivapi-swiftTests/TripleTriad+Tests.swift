import Testing
import xivapi_swift

@Suite("Triple Triad")
struct TripleTriad_Tests {
    let xivapi = xivapiClient()

    @Test("Card") func TripleTriadCard() async throws {
        let card: TripleTriadCard = try #require(await xivapi.getSheet(.TripleTriadCard, id: 346))
        
        #expect(card.row_id == 346)
        #expect(card.fields.Name == "Zenos Galvus")
        #expect(card.fields.Description == "“Did you find...fulfillment?”")
        #expect(card.backgroundPath != nil)
        #expect(card.imagePath != nil)
    }
    
    @Test("CardResident") func TripleTriadCardResident() async throws {
        let cardResident: TripleTriadCardResident = try #require(await xivapi.getSheet(.TripleTriadCardResident, id: 346))
        
        #expect(cardResident.row_id == 346)
        #expect(cardResident.type == "Garlean")
        
        #expect(cardResident.top == "6")
        #expect(cardResident.bottom == "9")
        #expect(cardResident.left == "9")
        #expect(cardResident.right == "6")
        
        #expect(cardResident.fields.Top == 6)
        #expect(cardResident.fields.Bottom == 9)
        #expect(cardResident.fields.Left == 9)
        #expect(cardResident.fields.Right == 6)
        
        #expect(cardResident.fields.TripleTriadCardRarity.stars == cardResident.stars)
    }

    @Test("NPC/Duel") func TripleTriad() async throws {
        let tt: TripleTriad = try #require(await xivapi.getSheet(.TripleTriad, id: 2293858))
        
        #expect(tt.fee == 25)
        #expect(tt.possibleRewards.count == 2)
        #expect(tt.cardFixed.first?.row_id == 284)
        #expect(tt.cardVariable.first?.row_id == 109)
        #expect(tt.rules.first?.row_id == 4)
    }
    
}

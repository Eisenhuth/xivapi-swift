import Foundation

public class xivapiClient {
    public init() {}
}

public extension xivapiClient {
    
    func getSheet<T: Codable>(_ sheet: Sheets, id: Int, queryItems: [URLQueryItem]? = nil) async -> T? {
        let url = Endpoint.sheet(sheet, id: id, queryItems: queryItems)!
        let response: T? = await loadData(url)
        
        return response
    }
        
    ///  get the recipe(s) for an item from the local dictionary
    /// - Parameter itemId: itemId
    /// - Returns: the RecipeID(s) for the provided Item
    func getItemRecipes(itemId: Int) async -> [Int]? {
        await getItemRecipeDict()[itemId]
    }
    
    /// a  local dictionary of all the items and  recipes in the game
    /// - Returns: a dictionary where the keys are ItemIDs and the values are RecipeIDs
    func getItemRecipeDict() async -> [Int : [Int]] {
        Bundle.module.decode("itemRecipeDict.json") as [Int : [Int]]
    }
    
    func search(_ sheets: [Sheets], name: String, next: String? = nil) async -> SearchResults? {
        let url = Endpoint.search(sheets, name: name, next: next)!
        let response: SearchResults? = await loadData(url)
        
        return response
    }
    
    func search(_ sheets: [Sheets], customQueries: [URLQueryItem], next: String? = nil) async -> SearchResults? {
        let url = Endpoint.search(sheets, customQueries: customQueries, next: next)!
        let response: SearchResults? = await loadData(url)
        
        return response
    }
}

public extension xivapiClient {
    
    func getItem(_ id: Int) async -> Item? {
        let url = Endpoint.sheet(.Item, id: id, queryItems: nil)!
        let response: Item? = await loadData(url)
        
        return response
    }
    
    func getItemMinimal(_ id: Int) async -> ItemMinimal? {
        let queryItems = [URLQueryItem(name: "fields", value: "Name,Description,Icon")]
        let url = Endpoint.sheet(.Item, id: id, queryItems: queryItems)!
        let response: ItemMinimal? = await loadData(url)
        
        return response
    }
    
    func getMap(_ id: Int) async -> XivMap? {
        let url = Endpoint.sheet(.Map, id: id)!
        let response: XivMap? = await loadData(url)
        
        return response
    }
    
    func getRecipe(_ id: Int) async -> Recipe? {
        let url = Endpoint.sheet(.Recipe, id: id)!
        let response: Recipe? = await loadData(url)
        
        return response
    }
    
    func getStatus(_ id: Int) async -> XivStatus? {
        let url = Endpoint.sheet(.Status, id: id)!
        let response: XivStatus? = await loadData(url)
        
        return response
    }
    
    func getAction(_ id: Int) async -> Action? {
        let url = Endpoint.sheet(.Action, id: id)!
        let response: Action? = await loadData(url)
        
        return response
    }
    
    func getPvPAction(_ id: Int) async -> PvPAction? {
        let url = Endpoint.sheet(.PvPAction, id: id)!
        let response: PvPAction? = await loadData(url)
        
        return response
    }
    
    func getTrait(_ id: Int) async -> Trait? {
        let url = Endpoint.sheet(.Trait, id: id)!
        let response: Trait? = await loadData(url)
        
        return response
    }
    
    func getNpcYell(_ id: Int) async -> NpcYell? {
        let url = Endpoint.sheet(.NpcYell, id: id)!
        let response: NpcYell? = await loadData(url)
        
        return response
    }
    
    func getNpcYell(_ id: Int, languages: [XivLanguage]) async -> NpcYell? {
        let lang = languages.map { "Text@\($0.rawValue)" }
        let languageQuery = URLQueryItem(name: "fields", value: lang.joined(separator: ","))
        let url = Endpoint.sheet(.NpcYell, id: id, queryItems: [languageQuery])!
        let response: NpcYell? = await loadData(url)
        return response
    }
    
}

import Foundation

public class xivapiClient {
    public init() {}
}

public extension xivapiClient {
    
    func getItem(_ id: Int) async -> Item? {
        let url = Endpoint.sheet(.Item, id: id, queryItems: nil)!
        let response: Item? = await loadData(url)
        
        return response
    }
    
    func getItem(_ id: Int, queryItems: [URLQueryItem]? = nil) async -> Item? {
        let url = Endpoint.sheet(.Item, id: id, queryItems: queryItems)!
        let response: Item? = await loadData(url)
        
        return response
    }
    
    func getMap(_ id: Int, queryItems: [URLQueryItem]? = nil) async -> XivMap? {
        let url = Endpoint.sheet(.Map, id: id, queryItems: queryItems)!
        let response: XivMap? = await loadData(url)
        
        return response
    }
    
    func getRecipe(_ id: Int, queryItems: [URLQueryItem]? = nil) async -> Recipe? {
        let url = Endpoint.sheet(.Recipe, id: id, queryItems: queryItems)!
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
    
    func getSheet<T: Codable>(_ sheet: Sheets, id: Int, queryItems: [URLQueryItem]? = nil) async -> T? {
        let url = Endpoint.sheet(sheet, id: id, queryItems: queryItems)!
        let response: T? = await loadData(url)
        
        return response
    }
    
    func getItemRecipes(itemId: Int) async -> [Int]? {
        await getItemRecipeDict()[itemId]
    }
    
    func getItemRecipeDict() async -> [Int : [Int]] {
        Bundle.module.decode("itemRecipeDict.json") as [Int : [Int]]
    }
}

public extension xivapiClient {
       
    /// search using a search string and multiple search indexes
    /// - Parameters:
    ///   - searchString: search string
    ///   - indexes: search indexes
    /// - Returns: search results
    func searchAllPages(searchString: String, indexes: [XivSearchIndexes]) async -> [XivResult]?{
        var queryItems = [
            URLQueryItem(name: "string", value: searchString),
            URLQueryItem(name: "indexes", value: indexes.map { $0.rawValue }.joined(separator: ","))
        ]
        
        let url = LegacyEndpoint.search(queryItems: queryItems).url!
        var response: LegacySearchResult? = await loadData(url)
        var results = [XivResult]()
        results.append(contentsOf: response?.Results ?? [])
        
        while response?.Pagination?.PageNext != nil {
            let nextPageUrl = url.appending(queryItems: [URLQueryItem(name: "page", value: response?.Pagination?.PageNext?.description)])
            
            response = await loadData(nextPageUrl)
            if response == nil { response = await loadData(nextPageUrl) } //attempt again, this shouldn't happen.
            results.append(contentsOf: response?.Results ?? [])
        }
        
        return results
    }
    
    func search(searchString: String, indexes: [XivSearchIndexes], queryItems: [URLQueryItem]?) async -> LegacySearchResult?{
        var queries = [
            URLQueryItem(name: "string", value: searchString),
            URLQueryItem(name: "indexes", value: indexes.map { $0.rawValue }.joined(separator: ","))
        ]
        if let queryItems { queries.append(contentsOf: queryItems) }
        
        let url = LegacyEndpoint.search(queryItems: queries).url!
        var response: LegacySearchResult? = await loadData(url)
        
        let test = LegacyEndpoint.search
        
        return response
    }

}



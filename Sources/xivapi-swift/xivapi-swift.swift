import Foundation

public class xivapiClient {
    private let private_key: String?
    
    public init(private_key: String? = nil) {
        self.private_key = private_key
    }
}

public extension xivapiClient {
    
    func getItem(_ id: Int) async -> Item? {
        let url = Endpoint.sheet(.Item, id: id, queryItems: nil, private_key: private_key)!
        let response: Item? = await loadData(url)
        
        return response
    }
    
    func getItem(_ id: Int, queryItems: [URLQueryItem]? = nil) async -> Item? {
        let url = Endpoint.sheet(.Item, id: id, queryItems: queryItems, private_key: private_key)!
        let response: Item? = await loadData(url)
        
        return response
    }
    
    func getRecipe(_ id: Int, queryItems: [URLQueryItem]? = nil) async -> Recipe? {
        let url = Endpoint.sheet(.Recipe, id: id, queryItems: queryItems, private_key: private_key)!
        let response: Recipe? = await loadData(url)
        
        return response
    }
    
    func getSheet<T: Codable>(_ sheet: Sheets, id: Int, queryItems: [URLQueryItem]? = nil) async -> T? {
        let url = Endpoint.sheet(sheet, id: id, queryItems: queryItems, private_key: private_key)!
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
    func search(searchString: String, indexes: [XivSearchIndexes]) async -> [XivResult]?{
        var queryItems = [
            URLQueryItem(name: "string", value: searchString),
            URLQueryItem(name: "indexes", value: indexes.map { $0.rawValue }.joined(separator: ","))
        ]
        
        let url = LegacyEndpoint.search(queryItems: queryItems, private_key: private_key).url!
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
}



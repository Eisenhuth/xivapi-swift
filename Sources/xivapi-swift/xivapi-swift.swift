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
    
    func getSheet<T: Codable>(_ sheet: Sheets, id: Int, queryItems: [URLQueryItem]? = nil) async -> T? {
        let url = Endpoint.sheet(sheet, id: id, queryItems: queryItems, private_key: private_key)!
        let response: T? = await loadData(url)
        
        return response
    }
}

public extension xivapiClient {
       
    /// search using  custom query items
    /// - Parameter queryItems: query items
    /// - Returns: search results
    func search(queryItems: [URLQueryItem]) async -> LegacySearchResult?{
        let url = LegacyEndpoint.search(queryItems: queryItems, private_key: private_key).url!
        var response: LegacySearchResult? = await loadData(url)
        await getAdditionalPages(url: url, response: &response)
        
        return response
    }
    
    /// search using  a search string
    /// - Parameter searchString: search string
    /// - Returns: search results
    func search(searchString: String) async -> LegacySearchResult?{
        let queryItems = [URLQueryItem(name: "string", value: searchString)]
        let url = LegacyEndpoint.search(queryItems: queryItems, private_key: private_key).url!
        var response: LegacySearchResult? = await loadData(url)
        await getAdditionalPages(url: url, response: &response)
        
        return response
    }
    
    /// search using a search string and a single search index
    /// - Parameters:
    ///   - searchString: search string
    ///   - index: search index
    /// - Returns: search results
    func search(searchString: String, index: XivSearchIndexes) async -> LegacySearchResult?{
        let queryItems = [
            URLQueryItem(name: "string", value: searchString),
            URLQueryItem(name: "indexes", value: index.rawValue)
        ]
        
        let url = LegacyEndpoint.search(queryItems: queryItems, private_key: private_key).url!
        var response: LegacySearchResult? = await loadData(url)
        await getAdditionalPages(url: url, response: &response)
        
        return response
    }
    
    /// search using a search string and multiple search indexes
    /// - Parameters:
    ///   - searchString: search string
    ///   - indexes: search indexes
    /// - Returns: search results
    func search(searchString: String, indexes: [XivSearchIndexes]) async -> LegacySearchResult?{
        var queryItems = [
            URLQueryItem(name: "string", value: searchString),
            URLQueryItem(name: "indexes", value: indexes.map { $0.rawValue }.joined(separator: ","))
        ]
        
        let url = LegacyEndpoint.search(queryItems: queryItems, private_key: private_key).url!
        var response: LegacySearchResult? = await loadData(url)
        await getAdditionalPages(url: url, response: &response)
        
        return response
    }
    
    //I should probably improve this at some point
    func getAdditionalPages(url: URL, response: inout LegacySearchResult?) async -> Void{
                
        if let pageTotal = response?.Pagination?.PageTotal {
            if pageTotal > 1 {
                for page in 1...pageTotal {
                    let pageQuery = URLQueryItem(name: "page", value: (page).description)
                    let pageUrl = url.appending(queryItems: [pageQuery])
                    let pageResponse: LegacySearchResult? = await loadData(url)
                    if let pageResults = pageResponse?.Results {
                        response?.Results?.append(contentsOf: pageResults)
                    }
                }
            }
        }
        
    }
}



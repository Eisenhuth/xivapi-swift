import Foundation

public class xivapiClient {
    private let private_key: String?
    
    public init(private_key: String? = nil) {
        self.private_key = private_key
    }
}

public extension xivapiClient {
    
    func getItem(itemId: Int, queryItems: [URLQueryItem]? = nil) async -> XivItem?{
        let url = Endpoint.item(itemId: itemId, queryItems: queryItems, private_key: private_key).url!
        let response: XivItem? = await loadData(url)
        
        return response
    }
    
    func getItemName(itemId: Int) async -> XivItem?{
        let url = Endpoint.item(itemId: itemId, queryItems: [URLQueryItem(name: "columns", value: "Name")], private_key: private_key).url!
        let response: XivItem? = await loadData(url)
        
        return response
    }
    
    func getNpcResident(id: Int, queryItems: [URLQueryItem]? = nil) async -> XivENpcResident?{
        let url = Endpoint.npcResident(id: id, queryItems: queryItems, private_key: private_key).url!
        let response: XivENpcResident? = await loadData(url)
        
        return response
    }
    
    func getNpcYell(id: Int, queryItems: [URLQueryItem]? = nil) async -> XivNpcYell?{
        let url = Endpoint.npcYell(id: id, queryItems: queryItems, private_key: private_key).url!
        let response: XivNpcYell? = await loadData(url)
        
        return response
    }
    
    func getRecipe(id: Int, queryItems: [URLQueryItem]? = nil) async -> XivRecipe?{
        let url = Endpoint.recipe(id: id, queryItems: queryItems, private_key: private_key).url!
        let response: XivRecipe? = await loadData(url)
        
        return response
    }
    
    func getSpecialShop(id: Int, queryItems: [URLQueryItem]? = nil) async -> XivSpecialShop?{
        let url = Endpoint.specialshop(id: id, queryItems: queryItems, private_key: private_key).url!
        let response: XivSpecialShop? = await loadData(url)
        
        return response
    }
    
    /// search using  custom query items
    /// - Parameter queryItems: query items
    /// - Returns: search results
    func search(queryItems: [URLQueryItem]) async -> XivSearchResult?{
        let url = Endpoint.search(queryItems: queryItems, private_key: private_key).url!
        var response: XivSearchResult? = await loadData(url)
        
        if #available(iOS 16.0, *) {
            response = await getAdditionalPages(url: url, response: &response)
        }
        return response
    }
    
    /// search using  a search string
    /// - Parameter searchString: search string
    /// - Returns: search results
    func search(searchString: String) async -> XivSearchResult?{
        let queryItems = [URLQueryItem(name: "string", value: searchString)]
        let url = Endpoint.search(queryItems: queryItems, private_key: private_key).url!
        var response: XivSearchResult? = await loadData(url)
        
        if #available(iOS 16.0, *) {
            response = await getAdditionalPages(url: url, response: &response)
        }
        return response
    }
    
    /// search using a search string and a single search index
    /// - Parameters:
    ///   - searchString: search string
    ///   - index: search index
    /// - Returns: search results
    func search(searchString: String, index: XivSearchIndexes) async -> XivSearchResult?{
        let queryItems = [
            URLQueryItem(name: "string", value: searchString),
            URLQueryItem(name: "indexes", value: index.rawValue)
        ]
        let url = Endpoint.search(queryItems: queryItems, private_key: private_key).url!
        var response: XivSearchResult? = await loadData(url)
        
        if #available(iOS 16.0, *) {
            response = await getAdditionalPages(url: url, response: &response)
        }
        return response
    }
    
    /// search using a search string and multiple search indexes
    /// - Parameters:
    ///   - searchString: search string
    ///   - indexes: search indexes
    /// - Returns: search results
    func search(searchString: String, indexes: [XivSearchIndexes]) async -> XivSearchResult?{
        var queryItems = [
            URLQueryItem(name: "string", value: searchString),
            URLQueryItem(name: "indexes", value: indexes.map { $0.rawValue }.joined(separator: ","))
        ]
        
        var responses = [XivSearchResult]()
        
        let url = Endpoint.search(queryItems: queryItems, private_key: private_key).url!
        var response: XivSearchResult? = await loadData(url)
        
        if #available(iOS 16.0, *) {
            response = await getAdditionalPages(url: url, response: &response)
        }
        
        return response
    }
    
    @available(iOS 16.0, *) //I should probably improve this at some point
    func getAdditionalPages(url: URL, response: inout XivSearchResult?) async -> XivSearchResult?{
        if let pagination = response?.Pagination {
            if let pageTotal = pagination.PageTotal {
                if pageTotal > 1 {
                    for page in 1..<pageTotal {
                        let pageQuery = URLQueryItem(name: "page", value: (page+1).description)
                        let pageUrl = url.appending(queryItems: [pageQuery])
                        let pageResponse: XivSearchResult? = await loadData(url)
                        if let pageResults = pageResponse?.Results {
                            response?.Results?.append(contentsOf: pageResults)
                        }
                    }
                }
            }
        }
        
        return response
    }
}



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
}



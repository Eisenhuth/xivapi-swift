import Foundation

public struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]?
    let private_key: String?
}

public extension Endpoint {
    static func item(itemId: Int, queryItems: [URLQueryItem]?, private_key: String?) -> Endpoint{
        return Endpoint(path: "/item/\(itemId)", queryItems: queryItems, private_key: private_key)
    }
    
    static func npcYell(id: Int, queryItems: [URLQueryItem]?, private_key: String?) -> Endpoint{
        return Endpoint(path: "/NpcYell/\(id)", queryItems: queryItems, private_key: private_key)
    }
    
    static func recipe(id: Int, queryItems: [URLQueryItem]?, private_key: String?) -> Endpoint{
        return Endpoint(path: "/recipe/\(id)", queryItems: queryItems, private_key: private_key)
    }
    
    static func search(queryItems: [URLQueryItem]?, private_key: String?) -> Endpoint{
        return Endpoint(path: "/search", queryItems: queryItems, private_key: private_key)
    }
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "xivapi.com"
        components.path = path
        
        if queryItems != nil {
            components.queryItems = queryItems
        }
        
        if private_key != nil {
            
            let privateKeyQuery = URLQueryItem(name: "private_key", value: private_key)
            
            components.queryItems == nil
            ? components.queryItems = [privateKeyQuery]
            : components.queryItems?.append(privateKeyQuery)
            
        }
        
        return components.url!
    }
}

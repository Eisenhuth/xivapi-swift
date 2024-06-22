import Foundation

public struct LegacyEndpoint {
    let path: String
    let queryItems: [URLQueryItem]?
    let private_key: String?
}

public extension LegacyEndpoint {
    static func search(queryItems: [URLQueryItem]?, private_key: String?) -> LegacyEndpoint{
        return LegacyEndpoint(path: "/search", queryItems: queryItems, private_key: private_key)
    }
}

extension LegacyEndpoint {
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

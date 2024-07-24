import Foundation

public struct LegacyEndpoint {
    let path: String
    let queryItems: [URLQueryItem]?
}

public extension LegacyEndpoint {
    static func search(queryItems: [URLQueryItem]?) -> LegacyEndpoint{
        return LegacyEndpoint(path: "/search", queryItems: queryItems)
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
        
        return components.url!
    }
}

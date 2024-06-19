import Foundation

public struct Endpoint {
    let sheet: Sheets
    let id: Int
    var queryItems: [URLQueryItem]? = nil
    var private_key: String? = nil
}

public extension Endpoint {
    
    static func sheet(_ sheet: Sheets, id: Int, queryItems: [URLQueryItem]?, private_key: String?) -> URL? {
        return Endpoint(sheet: sheet, id: id, queryItems: queryItems, private_key: private_key).url
    }
    
    static func sheet(_ sheet: Sheets, id: Int) -> URL?{
        return Endpoint(sheet: sheet, id: id).url
    }
    
    static func asset(at path: String) -> URL?{
        var components = URLComponents(string: "https://beta.xivapi.com/api/1/asset/\(path)")!
        components.queryItems = [URLQueryItem(name: "format", value: "png")]
        
        return components.url
    }
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents(string: "https://beta.xivapi.com/api/1/sheet/\(sheet)/\(id)")!
        
        if queryItems != nil {
            components.queryItems = queryItems
        }
        
        if private_key != nil {
            
            let privateKeyQuery = URLQueryItem(name: "private_key", value: private_key)
            
            components.queryItems == nil
            ? components.queryItems = [privateKeyQuery]
            : components.queryItems?.append(privateKeyQuery)
            
        }
        
        return components.url
    }
}

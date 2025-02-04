import Foundation

struct Endpoint {
    let sheet: Sheets
    let id: Int
    var queryItems: [URLQueryItem]? = nil
}

extension Endpoint {
    
    static let baseUrl: String = "https://v2.xivapi.com/api"
    
    static func asset(at path: String, format: Format = .jpg) -> URL?{
        var components = URLComponents(string: "\(baseUrl)/asset")!
        components.queryItems = [
            URLQueryItem(name: "path", value: path),
            URLQueryItem(name: "format", value: format.rawValue)
        ]
        
        return components.url
    }
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents(string: "\(Endpoint.baseUrl)/sheet/\(sheet)/\(id)")!
        
        if queryItems != nil {
            components.queryItems = queryItems
        }
        
        return components.url
    }
}

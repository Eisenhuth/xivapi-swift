import Foundation

public struct Endpoint {
    let sheet: Sheets
    let id: Int
    var queryItems: [URLQueryItem]? = nil
}

public extension Endpoint {
    
    static let baseUrl: String = "https://beta.xivapi.com/api/1"
    
    static func sheet(_ sheet: Sheets, id: Int, queryItems: [URLQueryItem]?) -> URL? {
        return Endpoint(sheet: sheet, id: id, queryItems: queryItems).url
    }
    
    static func sheet(_ sheet: Sheets, id: Int) -> URL?{
        return Endpoint(sheet: sheet, id: id).url
    }
    
    static func asset(at path: String) -> URL?{
        var components = URLComponents(string: "\(baseUrl)/asset/\(path)")!
        components.queryItems = [URLQueryItem(name: "format", value: "png")]
        
        return components.url
    }
    
    static func search(_ sheets: [Sheets], name: String, next: String?) -> URL? {
                
        var components = URLComponents(string: "\(baseUrl)/search")!
        
        let sheets = sheets.map { $0.rawValue }.joined(separator: ",")
        let sheetsQuery = URLQueryItem(name: "sheets", value: sheets)
        let nameQuery = URLQueryItem(name: "query", value: "Name~\"\(name)\"")
        let cursorQuery = URLQueryItem(name: "cursor", value: next)
        
        components.queryItems = [sheetsQuery, next == nil ? nameQuery : cursorQuery]
        
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

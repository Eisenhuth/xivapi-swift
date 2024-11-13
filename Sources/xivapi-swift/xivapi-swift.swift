import Foundation

public class xivapiClient {
    
    public var schema: String?
    public var version: String?
    public var baseUrl: URL = URL(string: "https://beta.xivapi.com/api/1")!
    
    public init(schema: String? = nil, version: String? = nil, baseUrl: URL? = nil) {
        self.schema = schema
        self.version = version
        self.baseUrl = baseUrl ?? self.baseUrl
    }
}

public extension xivapiClient {
    
    func getSheet<T: Codable>(_ sheet: Sheets, id: Int, queryItems: [URLQueryItem]? = nil) async -> T? {
        let url = sheetUrl(sheet: sheet, id: id, queryItems: queryItems, schema: schema, version: version)
        let response: T? = await loadData(url)
        
        return response
    }
        
    ///  get the recipe(s) for an item from the local dictionary
    /// - Parameter itemId: itemId
    /// - Returns: the RecipeID(s) for the provided Item
    func getItemRecipes(itemId: Int) async -> [Int]? {
        await getItemRecipeDict()[itemId]
    }
    
    /// a  local dictionary of all the items and  recipes in the game
    /// - Returns: a dictionary where the keys are ItemIDs and the values are RecipeIDs
    func getItemRecipeDict() async -> [Int : [Int]] {
        Bundle.module.decode("itemRecipeDict.json") as [Int : [Int]]
    }
    
    func search(_ sheets: [Sheets], name: String, next: String? = nil) async -> SearchResults? {
        let url = searchUrl(sheets, name: name, next: next)
        let response: SearchResults? = await loadData(url)
        
        return response
    }
    
    func search(_ sheets: [Sheets], customQueries: [URLQueryItem], next: String? = nil) async -> SearchResults? {
        let url = searchUrl(sheets, customQueries: customQueries, next: next)
        let response: SearchResults? = await loadData(url)
        
        return response
    }
}

public extension xivapiClient {
    
    func getItem(_ id: Int) async -> Item? { await getSheet(.Item, id: id) }
    func getMap(_ id: Int) async -> XivMap? { await getSheet(.Map, id: id) }
    func getRecipe(_ id: Int) async -> Recipe? { await getSheet(.Recipe, id: id) }
    func getStatus(_ id: Int) async -> XivStatus? { await getSheet(.Status, id: id) }
    func getAction(_ id: Int) async -> Action? { await getSheet(.Action, id: id) }
    func getPvPAction(_ id: Int) async -> PvPAction? { await getSheet(.PvPAction, id: id) }
    func getTrait(_ id: Int) async -> Trait? { await getSheet(.Trait, id: id) }
    func getNpcYell(_ id: Int) async -> NpcYell? { await getSheet(.NpcYell, id: id) }
}

public extension xivapiClient {
    
    func getItemMinimal(_ id: Int) async -> ItemMinimal? {
        let queryItems = [URLQueryItem(name: "fields", value: "Name,Description,Icon")]
        let url = sheetUrl(sheet: .Item, id: id, queryItems: queryItems, schema: schema, version: version)
        let response: ItemMinimal? = await loadData(url)
        
        return response
    }
    
    func getNpcYell(_ id: Int, languages: [XivLanguage]) async -> NpcYell? {
        let lang = languages.map { "Text@\($0.rawValue)" }
        let languageQuery = URLQueryItem(name: "fields", value: lang.joined(separator: ","))
        let url = sheetUrl(sheet: .NpcYell, id: id, queryItems: [languageQuery], schema: schema, version: version)
        let response: NpcYell? = await loadData(url)
        return response
    }
}

public extension xivapiClient {
    func sheetUrl(sheet: Sheets, id: Int, queryItems: [URLQueryItem]? = nil, schema: String? = nil, version: String? = nil) -> URL {
        var components = URLComponents(string: "\(baseUrl)/sheet/\(sheet)/\(id)")!
        
        if queryItems != nil { components.queryItems = queryItems }
        
        if schema != nil || version != nil {
            if queryItems == nil { components.queryItems = [] }
            if let schema { components.queryItems?.append(URLQueryItem(name: "schema", value: schema)) }
            if let version { components.queryItems?.append(URLQueryItem(name: "version", value: version)) }
        }
        
        return components.url!
    }
    
    func searchUrl(_ sheets: [Sheets], name: String, next: String?) -> URL {
        
        var components = URLComponents(string: "\(baseUrl)/search")!
        
        let sheets = sheets.map { $0.rawValue }.joined(separator: ",")
        let sheetsQuery = URLQueryItem(name: "sheets", value: sheets)
        let nameQuery = URLQueryItem(name: "query", value: "Name~\"\(name)\"")
        let cursorQuery = URLQueryItem(name: "cursor", value: next)
        
        components.queryItems = [sheetsQuery, next == nil ? nameQuery : cursorQuery]
        if let schema { components.queryItems?.append(URLQueryItem(name: "schema", value: schema)) }
        if let version { components.queryItems?.append(URLQueryItem(name: "version", value: version)) }
        
        return components.url!
    }
    
    func searchUrl(_ sheets: [Sheets], customQueries: [URLQueryItem], next: String?) -> URL {
        
        var components = URLComponents(string: "\(baseUrl)/search")!
        
        let sheets = sheets.map { $0.rawValue }.joined(separator: ",")
        let sheetsQuery = URLQueryItem(name: "sheets", value: sheets)
        let cursorQuery = URLQueryItem(name: "cursor", value: next)
        
        components.queryItems = [sheetsQuery]
        components.queryItems?.append(contentsOf: customQueries)
        if next != nil {
            components.queryItems?.append(cursorQuery)
        }
        if let schema { components.queryItems?.append(URLQueryItem(name: "schema", value: schema)) }
        if let version { components.queryItems?.append(URLQueryItem(name: "version", value: version)) }
        
        return components.url!
    }
    
    func assetUrl(at path: String, format: Format = .jpg) -> URL{
        var components = URLComponents(string: "\(baseUrl)/asset/\(path)")!
        components.queryItems = [URLQueryItem(name: "format", value: format.rawValue)]
        if let version { components.queryItems?.append(URLQueryItem(name: "version", value: version)) }
        
        return components.url!
    }
}

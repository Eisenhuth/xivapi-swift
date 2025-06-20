import Foundation
#if canImport(Combine)
public typealias CrossObservableObject = ObservableObject //(currently) only available on Apple platforms
#else
public protocol CrossObservableObject { } //empty, no ObservableObject sugar, but will otherwise work/compile on other platforms
#endif

public class xivapiClient: CrossObservableObject {
    
    public var schema: String?
    public var version: String?
    public var baseUrl: URL = URL(string: "https://v2.xivapi.com/api")!
    public var automaticallyPin: Bool = false
        
    public init(schema: String? = nil, version: String? = nil, baseUrl: URL? = nil, automaticallyPin: Bool = false) {
        self.schema = automaticallyPin ? verifiedSchema : schema
        self.version = automaticallyPin ? verifiedVersion : version
        self.baseUrl = baseUrl ?? self.baseUrl
    }
}

public extension xivapiClient {
    
    func getSheet<T: Codable>(_ sheet: Sheets, id: Int, queryItems: [URLQueryItem]? = nil) async -> T? {
        await getSheet(name: sheet.rawValue, id: id, queryItems: queryItems)
    }
    
    func getSheet<T: Codable>(name: String, id: Int, queryItems: [URLQueryItem]? = nil) async -> T? {
        let url = sheetUrl(name: name, id: id, queryItems: queryItems, schema: schema, version: version)
        let response: T? = await loadData(url)
        
        return response
    }
    
    func getSheetRows<T: Codable>(_ sheet: Sheets, rows: [Int], queryItems: [URLQueryItem]? = nil) async -> [T]? {
        await getSheetRows(sheet.rawValue, rows: rows, queryItems: queryItems)
    }
    
    func getSheetRows<T: Codable>(_ name: String, rows: [Int], queryItems: [URLQueryItem]? = nil) async -> [T]? {
        let url = sheetUrl(name: name, ids: rows, queryItems: queryItems)
        let response: MultiRows<T>? = await loadData(url)
        
        return response?.rows
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
    
    func listVersions() async -> [String]? { await listVersionsFull()?.versionNames }
    func listSheets() async -> [String]? { await listSheetsFull()?.sheetNames }

    func listVersionsFull() async -> VersionResponse? {
        let url = URLComponents(string: "\(baseUrl)/version")!.url!
        return await loadData(url) as VersionResponse?
    }
    
    func listSheetsFull() async -> SheetResponse? {
        let url = URLComponents(string: "\(baseUrl)/sheet")!.url!
        return await loadData(url) as SheetResponse?
    }
    
    func getCurrentSchema() async -> String? {
        let response: SchemaResponse? = await loadData(schemaUrl())
        return response?.schema
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
        sheetUrl(name: sheet.rawValue, id: id, queryItems: queryItems, schema: schema, version: version)
    }
    
    func sheetUrl(name: String, id: Int, queryItems: [URLQueryItem]? = nil, schema: String? = nil, version: String? = nil) -> URL {
        var components = URLComponents(string: "\(baseUrl)/sheet/\(name)/\(id)")!
        
        if queryItems != nil { components.queryItems = queryItems }
        
        if schema != nil || version != nil {
            if queryItems == nil { components.queryItems = [] }
            if let schema { components.queryItems?.append(URLQueryItem(name: "schema", value: schema)) }
            if let version { components.queryItems?.append(URLQueryItem(name: "version", value: version)) }
        }
        
        return components.url!
    }
    
    func sheetUrl(sheet: Sheets, ids: [Int], queryItems: [URLQueryItem]? = nil, schema: String? = nil, version: String? = nil) -> URL {
        sheetUrl(name: sheet.rawValue, ids: ids, queryItems: queryItems, schema: schema, version: version)
    }
    
    func sheetUrl(name: String, ids: [Int], queryItems: [URLQueryItem]? = nil, schema: String? = nil, version: String? = nil) -> URL {
        var components = URLComponents(string: "\(baseUrl)/sheet/\(name)")!
        components.queryItems = []
        components.queryItems?.append(URLQueryItem(name: "rows", value: ids.map { $0.description }.joined(separator: ",")))
        
        if let queryItems { components.queryItems?.append(contentsOf: queryItems) }
        if let schema { components.queryItems?.append(URLQueryItem(name: "schema", value: schema)) }
        if let version { components.queryItems?.append(URLQueryItem(name: "version", value: version)) }

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
        var components = URLComponents(string: "\(baseUrl)/asset")!
        components.queryItems = [
            URLQueryItem(name: "path", value: path),
            URLQueryItem(name: "format", value: format.rawValue)
        ]
        if let version { components.queryItems?.append(URLQueryItem(name: "version", value: version)) }
        
        return components.url!
    }
    
    func compositedAssetUrl(at path: String, format: Format = .jpg) -> URL{
        var components = URLComponents(string: "\(baseUrl)/asset/\(path)")!
        components.queryItems = [URLQueryItem(name: "format", value: "jpg")]
        return components.url!
    }
    
    func schemaUrl() -> URL {
        URLComponents(string: "\(baseUrl)/sheet/Item?rows=0&fields=")!.url!
    }
}

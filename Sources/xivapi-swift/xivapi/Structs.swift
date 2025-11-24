import Foundation

struct MultiRows<T: Codable>: Codable {
    let schema: String
    let rows: [T]
}

public struct SheetResponse: Codable {
    let sheets: [SheetEntry]
    
    var sheetNames: [String] {
        sheets.map(\.name)
    }
}

public struct SheetEntry: Codable {
    let name: String
}

public struct VersionResponse: Codable {
    let versions: [VersionEntry]
    
    public var versionNames: [String] {
        versions.flatMap(\.names)
    }
    
    public var latestKey: String? {
        versions.first { $0.names.contains("latest") }?.key
    }
    
    public var latestVersion: String? {
        versions.first(where: { $0.names.contains("latest") })?.names.first(where: { $0 != "latest" })
    }
}

public struct VersionEntry: Codable {
    let key: String
    let names: [String]
}

public struct SchemaResponse: Codable {
    let schema: String
}

public struct ValueStruct: Codable {
    public let value: Int
}

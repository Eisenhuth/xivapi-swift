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
    
    var versionNames: [String] {
        versions.flatMap(\.names)
    }
}

public struct VersionEntry: Codable {
    let names: [String]
}

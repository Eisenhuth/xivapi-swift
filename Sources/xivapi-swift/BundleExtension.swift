import Foundation

extension Bundle {
    public func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to find file \(file)")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to load data from \(file)")
        }
        
        guard let decoded = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("failed to load file \(file)")
        }
        
        return decoded
    }
}

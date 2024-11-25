import Foundation

public struct Icon: Codable, Hashable {
    public let id: Int
    public let path: String?
    public let path_hr1: String?
}

public extension Icon {
    
    func iconUrl(format: Format = .jpg) -> URL? {
        guard let path else { return nil }
        return Endpoint.asset(at: path, format: format)
    }
    
    func iconUrlHD(format: Format = .jpg) -> URL? {
        guard let path_hr1 else { return nil }
        return Endpoint.asset(at: path_hr1, format: format)
    }
}

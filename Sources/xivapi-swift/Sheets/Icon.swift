import Foundation

public struct Icon: Codable, Hashable {
    public let id: Int
    public let path: String?
    public let path_hr1: String?
}

public extension Icon {
    @available(*, deprecated, message: "Use iconUrl(format:) instead.", renamed: "iconUrl()" )
    var iconUrl: URL? { path != nil ? Endpoint.asset(at: path!, format: .jpg) : nil }
    @available(*, deprecated, message: "Use iconUrlHD(format:) instead.", renamed: "iconUrlHD()" )
    var iconUrlHD: URL? { path_hr1 != nil ? Endpoint.asset(at: path_hr1!, format: .jpg) : nil }
    
    func iconUrl(format: Format = .jpg) -> URL? {
        guard let path else { return nil }
        return Endpoint.asset(at: path, format: format)
    }
    
    func iconUrlHD(format: Format = .jpg) -> URL? {
        guard let path_hr1 else { return nil }
        return Endpoint.asset(at: path_hr1, format: format)
    }
}

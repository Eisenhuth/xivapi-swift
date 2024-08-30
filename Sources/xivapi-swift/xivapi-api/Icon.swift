import Foundation

public struct Icon: Codable, Hashable {
    public let id: Int
    public let path: String?
    public let path_hr1: String?
}

public extension Icon {
    var iconUrl: URL? { path != nil ? Endpoint.asset(at: path!, format: .jpg) : nil }
    var iconUrlHD: URL? { path_hr1 != nil ? Endpoint.asset(at: path_hr1!, format: .jpg) : nil }
}

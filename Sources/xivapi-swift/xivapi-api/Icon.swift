import Foundation

public struct Icon: Codable {
    public let id: Int
    public let path: String
    public let path_hr1: String
}

public extension Icon {
    var iconUrl: URL? { Endpoint.asset(at: path) }
    var iconUrlHD: URL? { Endpoint.asset(at: path_hr1) }
}

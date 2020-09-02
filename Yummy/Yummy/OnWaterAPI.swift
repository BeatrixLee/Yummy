import Foundation

struct OnWater: Codable {
    let query, requestID: String
    let lat, lon: Int
    var water: Bool

    enum CodingKeys: String, CodingKey {
        case query
        case requestID = "request_id"
        case lat, lon, water
    }
}

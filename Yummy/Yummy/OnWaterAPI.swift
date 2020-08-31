import Foundation

struct OnWater: Codable {
    let query, requestID: String
    let lat, lon: Int
    let water: Bool

    enum CodingKeys: String, CodingKey {
        case query
        case requestID = "request_id"
        case lat, lon, water
    }
}

import Foundation
import APIKit

struct GetTimelinesHomeRequest: Request, Authorized, ArrayExpected {
    typealias Element = StatusJson

    let method: HTTPMethod = .get
    let path = "/api/v1/timelines/home"

    let configuration: Configuration
    let accessToken: String
    let maxId: Int?
    let sinceId: Int?

    var queryParameters: [String: Any]? {
        var parameters: [String: Any] = [:]
        if let value = maxId { parameters["max_id"] = value }
        if let value = sinceId { parameters["sinceId"] = value }
        return parameters
    }
    
    var dataParser: DataParser {
        return JSONDataParser(readingOptions: [])
    }
}

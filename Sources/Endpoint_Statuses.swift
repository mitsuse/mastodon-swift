import Foundation
import APIKit

// TODO: Support for toot with media.
struct PostStatuses: Request, Authorized {
    typealias Response = StatusJson

    let method: HTTPMethod = .post
    let path = "/api/v1/statuses"

    let configuration: Configuration
    let accessToken: String
    let status: String
    let inReplyToId: Int?
    let sensitive: Bool?
    let spoilerText: String?
    let visibility: VisibilityJson?

    var bodyParameters: BodyParameters? {
        var object: [String: Any] = [
            "status": status,
        ]
        if let value = inReplyToId { object["in_reply_to_id"] = value }
        if let value = sensitive { object["sensitive"] = value ? "true" : "false" }
        if let value = spoilerText { object["spoiler_text"] = value }
        if let value = visibility { object["spoiler_text"] = value.rawValue }
        return FormURLEncodedBodyParameters(formObject: object)
    }

    var dataParser: DataParser {
        return JSONDataParser(readingOptions: [])
    }
}

struct DeleteStatuses: Request, Authorized {
    typealias Response = Void

    let method: HTTPMethod = .post
    var path: String { return "/api/v1/statuses/\(id)" }

    let configuration: Configuration
    let accessToken: String
    let id: Int
}

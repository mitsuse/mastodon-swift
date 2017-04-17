import Foundation
import Himotoki

public struct MentionJson {
    public let url: URL
    public let username: String
    public let acct: String
    public let id: Int
}

extension MentionJson: Decodable {
    public static func decode(_ e: Extractor) throws -> MentionJson {
        return try MentionJson(
            url: urlTransformer.apply(e <| "url"),
            username: e <| "username",
            acct: e <| "acct",
            id: e <| "id"
        )
    }
}

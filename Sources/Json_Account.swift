import Foundation
import Himotoki

public struct AccountJson {
    public let id: Int
    public let username: String
    public let acct: String
    public let displayName: String
    public let locked: Bool
    public let createdAt: String
    public let followersCount: Int
    public let followingCount: Int
    public let statusCount: Int
    public let note: String
    public let url: URL
    public let avatar: URL
    public let avatarStatic: URL
    public let header: URL
    public let headerStatic: URL
}

extension AccountJson: Decodable {
    public static func decode(_ e: Extractor) throws -> AccountJson {
        return try AccountJson(
            id: e <| "id",
            username: e <| "username",
            acct: e <| "acct",
            displayName: e <| "display_name",
            locked: e <| "locked",
            createdAt: e <| "created_at",
            followersCount: e <| "followers_count",
            followingCount: e <| "following_count",
            statusCount: e <| "statusCount",
            note: e <| "note",
            url: urlTransformer.apply(e <| "url"),
            avatar: urlTransformer.apply(e <| "avatar"),
            avatarStatic: urlTransformer.apply(e <| "avatar_static"),
            header: urlTransformer.apply(e <| "header"),
            headerStatic:urlTransformer.apply(e <| "header_static")
        )
    }
}

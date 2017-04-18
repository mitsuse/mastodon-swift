import Foundation
import Himotoki

public struct StatusJson {
    public let id: Int
    public let uri: String
    public let url: URL
    public let account: AccountJson
    public let inReplyToId: Int?
    public let inReplyToAccountId: Int?
    public let reblog: Reference<StatusJson?>
    public let content: String
    public let createdAt: String
    public let reblogsCount: Int
    public let favouritesCount: Int
    public let reblogged: Bool?
    public let favourited: Bool?
    public let sensitive: Bool?
    public let spoilerText: String
    public let visibility: VisibilityJson
    public let mediaAttachments: [AttachmentJson]
    public let mentions: [MentionJson]
    public let tags: [TagJson]
    public let application: ApplicationJson?
}

extension StatusJson: Decodable {
    public static func decode(_ e: Extractor) throws -> StatusJson {
        return try StatusJson(
            id: e <| "id",
            uri: e <| "uri",
            url: urlTransformer.apply(e <| "url"),
            account: e <| "account",
            inReplyToId: e <|? "in_reply_to_id",
            inReplyToAccountId: e <|? "in_reply_to_account_id",
            reblog: Reference(e <|? "reblog"),
            content: e <| "content",
            createdAt: e <| "created_at",
            reblogsCount: e <| "reblogs_count",
            favouritesCount: e <| "favourites_count",
            reblogged: e <|? "reblogged",
            favourited: e <|? "favourited",
            sensitive: e <|? "sensitive",
            spoilerText: e <| "spoiler_text",
            visibility: e <| "visibility",
            mediaAttachments: e <|| "media_attachments",
            mentions: e <|| "mentions",
            tags: e <|| "tags",
            application: e <|? "application"
        )
    }
}

import Himotoki

public struct OAuthTokenJson {
    public let accessToken: String
    public let createdAt: Int
    public let scope: String
    public let tokenType: String
}

extension OAuthTokenJson: Decodable {
    public static func decode(_ e: Extractor) throws -> OAuthTokenJson {
        return try OAuthTokenJson(
            accessToken: e <| "access_token",
            createdAt: e <| "created_at",
            scope: e <| "scope",
            tokenType: e <| "token_type"
        )
    }
}

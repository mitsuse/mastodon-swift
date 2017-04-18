import Himotoki

public struct RelationshipJson {
    public let id: Int
    public let following: Bool
    public let followedBy: Bool
    public let blocking: Bool
    public let muting: Bool
    public let requested: Bool
}

extension RelationshipJson: Decodable {
    public static func decode(_ e: Extractor) throws -> RelationshipJson {
        return try RelationshipJson(
            id: e <| "id",
            following: e <| "following",
            followedBy: e <| "followed_by",
            blocking: e <| "blocking",
            muting: e <| "muting",
            requested: e <| "requested"
        )
    }
}

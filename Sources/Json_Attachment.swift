import Foundation
import Himotoki

public struct AttachmentJson {
    public let id: Int
    public let type: AttachmentTypeJson
    public let url: URL
    public let remoteUrl: URL
    public let previewUrl: URL
    public let textUrl: URL?
}

public enum AttachmentTypeJson: String {
    case image
    case video
    case gifv
}

extension AttachmentJson: Decodable {
    public static func decode(_ e: Extractor) throws -> AttachmentJson {
        return try AttachmentJson(
            id: e <| "id",
            type: e <| "type",
            url: urlTransformer.apply(e <| "url"),
            remoteUrl: urlTransformer.apply(e <| "remote_url"),
            previewUrl: urlTransformer.apply(e <| "preview_url"),
            textUrl: urlTransformer.apply(e <|? "text_url")
        )
    }
}

extension AttachmentTypeJson: Decodable {
}

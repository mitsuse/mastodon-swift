import Foundation
import Himotoki

public struct ApplicationJson {
    public let name: String
    public let website: URL?
}

extension ApplicationJson: Decodable {
    public static func decode(_ e: Extractor) throws -> ApplicationJson {
        return try ApplicationJson(
            name: e <| "name",
            website: urlTransformer.apply(e <|? "website")
        )
    }
}


import Foundation
import Himotoki

public struct TagJson {
    public let name: String
    public let url: URL
}

extension TagJson: Decodable {
    public static func decode(_ e: Extractor) throws -> TagJson {
        return try TagJson(
            name: e <| "name",
            url: urlTransformer.apply(e <| "url")
        )
    }
}

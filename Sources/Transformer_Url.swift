import Foundation
import Himotoki

let urlTransformer = Transformer<String, URL> { s throws -> URL in
    guard let url = URL(string: s) else {
        throw customError("Invalid URL string: \(s)")
    }
    return url
}

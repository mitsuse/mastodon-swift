import Foundation
import APIKit

struct GetAccounts: Request, Authorized {
    typealias Response = AccountJson

    let method: HTTPMethod = .get
    var path: String { return "/account/\(id)" }

    let configuration: Configuration
    let accessToken: String
    let id: String

    var dataParser: DataParser {
        return JSONDataParser(readingOptions: [])
    }
}

struct VerifyCredentials: Request, Authorized {
    typealias Response = AccountJson

    let method: HTTPMethod = .get
    let path = "/account/verify_credentials"

    let configuration: Configuration
    let accessToken: String

    var dataParser: DataParser {
        return JSONDataParser(readingOptions: [])
    }
}

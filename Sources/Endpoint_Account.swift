import Foundation
import APIKit

struct GetAccounts: Request, Authorized {
    typealias Response = AccountJson

    let method: HTTPMethod = .get
    var path: String { return "/api/v1/account/\(id)" }

    let configuration: Configuration
    let accessToken: String
    let id: Int

    var dataParser: DataParser {
        return JSONDataParser(readingOptions: [])
    }
}

struct VerifyCredentials: Request, Authorized {
    typealias Response = AccountJson

    let method: HTTPMethod = .get
    let path = "/api/v1/account/verify_credentials"

    let configuration: Configuration
    let accessToken: String

    var dataParser: DataParser {
        return JSONDataParser(readingOptions: [])
    }
}

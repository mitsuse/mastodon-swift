import Foundation
import APIKit

struct GetAccounts: Request, Authorized {
    typealias Response = AccountJson

    let method: HTTPMethod = .get
    var path: String { return "/api/v1/accounts/\(id)" }

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
    let path = "/api/v1/accounts/verify_credentials"

    let configuration: Configuration
    let accessToken: String

    var dataParser: DataParser {
        return JSONDataParser(readingOptions: [])
    }
}

struct BlockAccountsRequest: Request, Authorized {
    typealias  Response = RelationshipJson

    let method: HTTPMethod = .post
    var path: String { return "/api/v1/accounts/\(id)/block" }

    let configuration: Configuration
    let accessToken: String
    let id: Int

    var dataParser: DataParser {
        return JSONDataParser(readingOptions: [])
    }
}

struct UnblockAccountsRequest: Request, Authorized {
    typealias  Response = RelationshipJson

    let method: HTTPMethod = .post
    var path: String { return "/api/v1/accounts/\(id)/unblock" }

    let configuration: Configuration
    let accessToken: String
    let id: Int

    var dataParser: DataParser {
        return JSONDataParser(readingOptions: [])
    }
}

struct MuteAccountsRequest: Request, Authorized {
    typealias  Response = RelationshipJson

    let method: HTTPMethod = .post
    var path: String { return "/api/v1/accounts/\(id)/mute" }

    let configuration: Configuration
    let accessToken: String
    let id: Int

    var dataParser: DataParser {
        return JSONDataParser(readingOptions: [])
    }
}

struct UnmuteAccountsRequest: Request, Authorized {
    typealias  Response = RelationshipJson

    let method: HTTPMethod = .post
    var path: String { return "/api/v1/accounts/\(id)/unmute" }

    let configuration: Configuration
    let accessToken: String
    let id: Int

    var dataParser: DataParser {
        return JSONDataParser(readingOptions: [])
    }
}

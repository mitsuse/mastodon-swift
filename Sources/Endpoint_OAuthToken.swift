import Foundation
import APIKit

struct PostOAuthTokenRequest: Request {
    typealias Response = OAuthTokenJson

    let method: HTTPMethod = .post
    let path = "/oauth/token"

    let configuration: Configuration
    let userName: String
    let password: String
    let scope: String

    var bodyParameters: BodyParameters? {
        return FormURLEncodedBodyParameters(
            formObject: [
                "client_id": configuration.clientId,
                "client_secret": configuration.clientSecret,
                "grant_type": password,
                "username": userName,
                "scope": scope,
            ]
        )
    }

    var dataParser: DataParser {
        return JSONDataParser(readingOptions: [])
    }
}

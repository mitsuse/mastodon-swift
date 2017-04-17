import Result

public protocol Client {
    var configuration: Configuration { get }

    func postOAuthToken(
        userName: String,
        password: String,
        scope: String,
        complete: @escaping (Result<OAuthTokenJson, Error>) -> Void
    )
}

public struct Configuration {
    public let server: String
    public let clientId: String
    public let clientSecret: String

    public init(server: String, clientId: String, clientSecret: String) {
        self.server = server
        self.clientId = clientId
        self.clientSecret = clientSecret
    }
}

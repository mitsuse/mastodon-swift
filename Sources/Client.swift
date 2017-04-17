import Result

public protocol Client {
    var configuration: Configuration { get }

    func postOAuthToken(
        userName: String,
        password: String,
        scope: String,
        complete: @escaping (Result<OAuthTokenJson, Error>) -> Void
    )

    func getAccounts(accessToken: String, id: Int, complete: @escaping (Result<AccountJson, Error>) -> Void)

    func verifyCredentials(accessToken: String, complete: @escaping (Result<AccountJson, Error>) -> Void)

    // TODO: Support for toot with media.
    func postStatuses(
        accessToken: String,
        status: String,
        inReplyToId: Int?,
        sensitive: Bool?,
        spoilerText: String?,
        visibility: VisibilityJson?,
        complete: @escaping (Result<StatusJson, Error>) -> Void
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

import Result

public protocol Client {
    var configuration: Configuration { get }

    @discardableResult
    func postOAuthToken(
        userName: String,
        password: String,
        scope: String,
        complete: @escaping (Result<OAuthTokenJson, Error>) -> Void
    ) -> Cancellable

    @discardableResult
    func getAccounts(
        accessToken: String,
        id: Int,
        complete: @escaping (Result<AccountJson, Error>) -> Void
    ) -> Cancellable

    @discardableResult
    func verifyCredentials(
        accessToken: String,
        complete: @escaping (Result<AccountJson, Error>) -> Void
    ) -> Cancellable

    @discardableResult
    func blockAccounts(
        accessToken: String,
        id: Int,
        complete: @escaping (Result<RelationshipJson, Error>) -> Void
    ) -> Cancellable

    @discardableResult
    func unblockAccounts(
        accessToken: String,
        id: Int,
        complete: @escaping (Result<RelationshipJson, Error>) -> Void
    ) -> Cancellable

    // TODO: Support for toot with media.
    @discardableResult
    func postStatuses(
        accessToken: String,
        status: String,
        inReplyToId: Int?,
        sensitive: Bool?,
        spoilerText: String?,
        visibility: VisibilityJson?,
        complete: @escaping (Result<StatusJson, Error>) -> Void
    ) -> Cancellable

    @discardableResult
    func deleteStatuses(
        accessToken: String,
        id: Int,
        complete: @escaping (Result<Void, Error>) -> Void
    ) -> Cancellable

    @discardableResult
    func getTimelinesHome(
        accessToken: String,
        maxId: Int?,
        sinceId: Int?,
        complete: @escaping (Result<[StatusJson], Error>) -> Void
    ) -> Cancellable
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

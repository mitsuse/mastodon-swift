import APIKit
import Himotoki
import Result

public struct DefaultClient: Client {
    public let configuration: Configuration
    public let session: Session

    public init(configuration: Configuration, session: Session = .shared) {
        self.configuration = configuration
        self.session = session
    }

    public func postOAuthToken(
        userName: String,
        password: String,
        scope: String,
        complete: @escaping (Result<OAuthTokenJson, Error>) -> Void
    ) {
        return send(
            request: PostOAuthTokenRequest(
                configuration: configuration,
                userName: userName,
                password: password,
                scope: scope
            ),
            complete: complete
        )
    }

    public func getAccounts(accessToken: String, id: Int, complete: @escaping (Result<AccountJson, Error>) -> Void) {
        return send(
            request: GetAccounts(
                configuration: configuration,
                accessToken: accessToken,
                id: id
            ),
            complete: complete
        )
    }

    public func verifyCredentials(accessToken: String, complete: @escaping (Result<AccountJson, Error>) -> Void) {
        return send(
            request: VerifyCredentials(
                configuration: configuration,
                accessToken: accessToken
            ),
            complete: complete
        )
    }

    // TODO: Support for toot with media.
    public func postStatuses(
        accessToken: String,
        status: String,
        inReplyToId: Int?,
        sensitive: Bool?,
        spoilerText: String?,
        visibility: VisibilityJson?,
        complete: @escaping (Result<StatusJson, Error>) -> Void
    ) {
        return send(
            request: PostStatuses(
                configuration: configuration,
                accessToken: accessToken,
                status: status,
                inReplyToId: inReplyToId,
                sensitive: sensitive,
                spoilerText: spoilerText,
                visibility: visibility
            ),
            complete: complete
        )
    }

    private func send<Request: Mastodon.Request>(
        request: Request,
        complete: @escaping (Result<Request.Response, Error>) -> Void
    ) where Request.Response: Decodable {
        self.session.send(request) {
            complete($0.mapError(convert))
        }
    }
}

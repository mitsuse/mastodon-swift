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

    private func send<Request: Mastodon.Request>(
        request: Request,
        complete: @escaping (Result<Request.Response, Error>) -> Void
    ) where Request.Response: Decodable {
        self.session.send(request) {
            complete($0.mapError(convert))
        }
    }
}

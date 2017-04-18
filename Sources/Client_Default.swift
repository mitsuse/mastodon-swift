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

    @discardableResult
    public func postOAuthToken(
        userName: String,
        password: String,
        scope: String,
        complete: @escaping (Result<OAuthTokenJson, Error>) -> Void
    ) -> Cancellable {
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

    @discardableResult
    public func getAccounts(
        accessToken: String,
        id: Int,
        complete: @escaping (Result<AccountJson, Error>) -> Void
    ) -> Cancellable {
        return send(
            request: GetAccounts(
                configuration: configuration,
                accessToken: accessToken,
                id: id
            ),
            complete: complete
        )
    }

    @discardableResult
    public func verifyCredentials(
        accessToken: String,
        complete: @escaping (Result<AccountJson, Error>) -> Void
    ) -> Cancellable {
        return send(
            request: VerifyCredentials(
                configuration: configuration,
                accessToken: accessToken
            ),
            complete: complete
        )
    }

    @discardableResult
    public func followAccounts(
        accessToken: String,
        id: Int,
        complete: @escaping (Result<RelationshipJson, Error>) -> Void
    ) -> Cancellable {
        return send(
            request: FollowAccountsRequest(
                configuration: configuration,
                accessToken: accessToken,
                id: id
            ),
            complete: complete
        )
    }

    @discardableResult
    public func unfollowAccounts(
        accessToken: String,
        id: Int,
        complete: @escaping (Result<RelationshipJson, Error>) -> Void
    ) -> Cancellable {
        return send(
            request: UnfollowAccountsRequest(
                configuration: configuration,
                accessToken: accessToken,
                id: id
            ),
            complete: complete
        )
    }

    @discardableResult
    public func blockAccounts(
        accessToken: String,
        id: Int,
        complete: @escaping (Result<RelationshipJson, Error>) -> Void
    ) -> Cancellable {
        return send(
            request: BlockAccountsRequest(
                configuration: configuration,
                accessToken: accessToken,
                id: id
            ),
            complete: complete
        )
    }

    @discardableResult
    public func unblockAccounts(
        accessToken: String,
        id: Int,
        complete: @escaping (Result<RelationshipJson, Error>) -> Void
    ) -> Cancellable {
        return send(
            request: UnblockAccountsRequest(
                configuration: configuration,
                accessToken: accessToken,
                id: id
            ),
            complete: complete
        )
    }

    @discardableResult
    public func muteAccounts(
        accessToken: String,
        id: Int,
        complete: @escaping (Result<RelationshipJson, Error>) -> Void
    ) -> Cancellable {
        return send(
            request: MuteAccountsRequest(
                configuration: configuration,
                accessToken: accessToken,
                id: id
            ),
            complete: complete
        )
    }

    @discardableResult
    public func unmuteAccounts(
        accessToken: String,
        id: Int,
        complete: @escaping (Result<RelationshipJson, Error>) -> Void
    ) -> Cancellable {
        return send(
            request: UnmuteAccountsRequest(
                configuration: configuration,
                accessToken: accessToken,
                id: id
            ),
            complete: complete
        )
    }

    // TODO: Support for toot with media.
    @discardableResult
    public func postStatuses(
        accessToken: String,
        status: String,
        inReplyToId: Int?,
        sensitive: Bool?,
        spoilerText: String?,
        visibility: VisibilityJson?,
        complete: @escaping (Result<StatusJson, Error>) -> Void
    ) -> Cancellable {
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

    @discardableResult
    public func deleteStatuses(
        accessToken: String,
        id: Int,
        complete: @escaping (Result<Void, Error>) -> Void
    ) -> Cancellable {
        return send(
            request: DeleteStatuses(
                configuration: configuration,
                accessToken: accessToken,
                id: id
            ),
            complete: complete
        )
    }

    @discardableResult
    public func getTimelinesHome(
        accessToken: String,
        maxId: Int?,
        sinceId: Int?,
        complete: @escaping (Result<[StatusJson], Error>) -> Void
    ) -> Cancellable {
        return send(
            request: GetTimelinesHomeRequest(
                configuration: configuration,
                accessToken: accessToken,
                maxId: maxId,
                sinceId: sinceId
            ),
            complete: complete
        )
    }

    private func send<Request: Mastodon.Request>(
        request: Request,
        complete: @escaping (Result<Request.Response, Error>) -> Void
    ) -> Cancellable {
        let task = self.session.send(request) {
            complete($0.mapError(convert))
        }
        return Cancellable { [weak task] in task?.cancel() }
    }
}

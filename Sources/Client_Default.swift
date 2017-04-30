import APIKit
import Himotoki
import PromiseKit

public struct DefaultClient: Client {
    public let configuration: Configuration
    public let session: Session

    public init(configuration: Configuration, session: Session = .shared) {
        self.configuration = configuration
        self.session = session
    }

    public func postOAuthToken(userName: String, password: String, scope: String) -> Promise<OAuthTokenJson> {
        return send(
            request: PostOAuthTokenRequest(
                configuration: configuration,
                userName: userName,
                password: password,
                scope: scope
            )
        )
    }

    public func getAccounts(accessToken: String, id: Int) -> Promise<AccountJson> {
        return send(
            request: GetAccounts(
                configuration: configuration,
                accessToken: accessToken,
                id: id
            )
        )
    }

    public func verifyCredentials(accessToken: String) -> Promise<AccountJson> {
        return send(
            request: VerifyCredentials(
                configuration: configuration,
                accessToken: accessToken
            )
        )
    }

    public func followAccounts(accessToken: String, id: Int) -> Promise<RelationshipJson> {
        return send(
            request: FollowAccountsRequest(
                configuration: configuration,
                accessToken: accessToken,
                id: id
            )
        )
    }

    public func unfollowAccounts(accessToken: String, id: Int) -> Promise<RelationshipJson> {
        return send(
            request: UnfollowAccountsRequest(
                configuration: configuration,
                accessToken: accessToken,
                id: id
            )
        )
    }

    public func blockAccounts(accessToken: String, id: Int) -> Promise<RelationshipJson> {
        return send(
            request: BlockAccountsRequest(
                configuration: configuration,
                accessToken: accessToken,
                id: id
            )
        )
    }

    public func unblockAccounts(accessToken: String, id: Int) -> Promise<RelationshipJson> {
        return send(
            request: UnblockAccountsRequest(
                configuration: configuration,
                accessToken: accessToken,
                id: id
            )
        )
    }

    public func muteAccounts(accessToken: String, id: Int) -> Promise<RelationshipJson> {
        return send(
            request: MuteAccountsRequest(
                configuration: configuration,
                accessToken: accessToken,
                id: id
            )
        )
    }

    public func unmuteAccounts(accessToken: String, id: Int) -> Promise<RelationshipJson> {
        return send(
            request: UnmuteAccountsRequest(
                configuration: configuration,
                accessToken: accessToken,
                id: id
            )
        )
    }

    // TODO: Support for toot with media.
    public func postStatuses(accessToken: String, status: String, inReplyToId: Int?, sensitive: Bool?, spoilerText: String?, visibility: VisibilityJson?) -> Promise<StatusJson> {
        return send(
            request: PostStatuses(
                configuration: configuration,
                accessToken: accessToken,
                status: status,
                inReplyToId: inReplyToId,
                sensitive: sensitive,
                spoilerText: spoilerText,
                visibility: visibility
            )
        )
    }

    public func deleteStatuses(accessToken: String, id: Int) -> Promise<Void> {
        return send(
            request: DeleteStatuses(
                configuration: configuration,
                accessToken: accessToken,
                id: id
            )
        )
    }

    public func getTimelinesHome(accessToken: String, maxId: Int?, sinceId: Int?) -> Promise<[StatusJson]> {
        return send(
            request: GetTimelinesHomeRequest(
                configuration: configuration,
                accessToken: accessToken,
                maxId: maxId,
                sinceId: sinceId
            )
        )
    }

    private func send<Request: Mastodon.Request>(request: Request) -> Promise<Request.Response> {
        return Promise { [weak session] fulfill, reject in
            session?.send(request) { result in
                switch result {
                case let .success(response): fulfill(response)
                case let .failure(error): reject(error)
                }
            }
        }
    }
}

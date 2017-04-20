import RxSwift

public protocol Client {
    var configuration: Configuration { get }

    func postOAuthToken(userName: String, password: String, scope: String) -> Single<OAuthTokenJson>
    func getAccounts(accessToken: String, id: Int) -> Single<AccountJson>
    func verifyCredentials(accessToken: String) -> Single<AccountJson>
    func followAccounts(accessToken: String, id: Int) -> Single<RelationshipJson>
    func unfollowAccounts(accessToken: String, id: Int) -> Single<RelationshipJson>
    func blockAccounts(accessToken: String, id: Int) -> Single<RelationshipJson>
    func unblockAccounts(accessToken: String, id: Int) -> Single<RelationshipJson>
    func muteAccounts(accessToken: String, id: Int) -> Single<RelationshipJson>
    func unmuteAccounts(accessToken: String, id: Int) -> Single<RelationshipJson>
    func postStatuses(accessToken: String, status: String, inReplyToId: Int?, sensitive: Bool?, spoilerText: String?, visibility: VisibilityJson?) -> Single<StatusJson>
    func deleteStatuses(accessToken: String, id: Int) -> Single<Void>
    func getTimelinesHome(accessToken: String, maxId: Int?, sinceId: Int?) -> Single<[StatusJson]>
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

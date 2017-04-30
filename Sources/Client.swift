import PromiseKit

public protocol Client {
    var configuration: Configuration { get }

    func postOAuthToken(userName: String, password: String, scope: String) -> Promise<OAuthTokenJson>
    func getAccounts(accessToken: String, id: Int) -> Promise<AccountJson>
    func verifyCredentials(accessToken: String) -> Promise<AccountJson>
    func followAccounts(accessToken: String, id: Int) -> Promise<RelationshipJson>
    func unfollowAccounts(accessToken: String, id: Int) -> Promise<RelationshipJson>
    func blockAccounts(accessToken: String, id: Int) -> Promise<RelationshipJson>
    func unblockAccounts(accessToken: String, id: Int) -> Promise<RelationshipJson>
    func muteAccounts(accessToken: String, id: Int) -> Promise<RelationshipJson>
    func unmuteAccounts(accessToken: String, id: Int) -> Promise<RelationshipJson>
    func postStatuses(accessToken: String, status: String, inReplyToId: Int?, sensitive: Bool?, spoilerText: String?, visibility: VisibilityJson?) -> Promise<StatusJson>
    func deleteStatuses(accessToken: String, id: Int) -> Promise<Void>
    func getTimelinesHome(accessToken: String, maxId: Int?, sinceId: Int?) -> Promise<[StatusJson]>
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

import PromiseKit

public protocol Client {
    func postOAuthToken(configuration: Configuration, userName: String, password: String, scope: String) -> Promise<OAuthTokenJson>
    func getAccounts(configuration: Configuration, accessToken: String, id: Int) -> Promise<AccountJson>
    func verifyCredentials(configuration: Configuration, accessToken: String) -> Promise<AccountJson>
    func followAccounts(configuration: Configuration, accessToken: String, id: Int) -> Promise<RelationshipJson>
    func unfollowAccounts(configuration: Configuration, accessToken: String, id: Int) -> Promise<RelationshipJson>
    func blockAccounts(configuration: Configuration, accessToken: String, id: Int) -> Promise<RelationshipJson>
    func unblockAccounts(configuration: Configuration, accessToken: String, id: Int) -> Promise<RelationshipJson>
    func muteAccounts(configuration: Configuration, accessToken: String, id: Int) -> Promise<RelationshipJson>
    func unmuteAccounts(configuration: Configuration, accessToken: String, id: Int) -> Promise<RelationshipJson>
    func postStatuses(configuration: Configuration, accessToken: String, status: String, inReplyToId: Int?, sensitive: Bool?, spoilerText: String?, visibility: VisibilityJson?) -> Promise<StatusJson>
    func deleteStatuses(configuration: Configuration, accessToken: String, id: Int) -> Promise<Void>
    func getTimelinesHome(configuration: Configuration, accessToken: String, maxId: Int?, sinceId: Int?) -> Promise<[StatusJson]>
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

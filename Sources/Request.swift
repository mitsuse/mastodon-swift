import Foundation
import APIKit
import Himotoki

public protocol Request: APIKit.Request {
    var configuration: Configuration { get }
}

extension Request {
    public var baseURL: URL {
        return URL(string: configuration.server)!
    }
}

extension Request where Response: Decodable {
    public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try Response.decodeValue(object)
    }
}

extension Request where Response == Void {
    public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return ()
    }
}

public protocol Authorized {
    var accessToken: String { get }
}

extension Request where Self: Authorized {
    public var headerFields: [String: String] {
        return [
            "Authorization": "Bearer \(accessToken)",
        ]
    }
}

public protocol ArrayExpected {
    associatedtype Element: Decodable
}

extension Request where Self: ArrayExpected {
    public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> [Element] {
        return try decodeArray(object)
    }
}

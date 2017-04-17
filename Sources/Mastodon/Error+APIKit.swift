import APIKit

func convert(error: SessionTaskError) -> Error {
    switch error {
    case .connectionError:
        return .connection
    case let .requestError(error):
        return (error as? RequestError).map(convert) ?? .fatal
    case let .responseError(error):
        return (error as? ResponseError).map(convert) ?? .fatal
    }
}

func convert(error: RequestError) -> Error {
    let reason: InvalidRequestReason
    switch error {
    case let .invalidBaseURL(url): reason = .endpoint(url)
    case .unexpectedURLRequest: reason = .unexpected
    }
    return .request(reason)
}

func convert(error: ResponseError) -> Error {
    let reason: InvalidResponseReason
    switch error {
    case .nonHTTPURLResponse: reason = .broken
    case let .unacceptableStatusCode(statusCode): reason = .unacceptableStatusCode(statusCode)
    case let .unexpectedObject(object): reason = .unexpectedBody(object)
    }
    return .response(reason)
}

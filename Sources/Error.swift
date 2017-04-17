import Foundation

public enum Error: Swift.Error {
	case connection
	case request(InvalidRequestReason)
	case response(InvalidResponseReason)
	case fatal
}

public enum InvalidRequestReason {
	case endpoint(URL)
	case unexpected
}

public enum InvalidResponseReason {
	case broken
	case unacceptableStatusCode(Int)
	case unexpectedBody(Any)
}

import Himotoki

public enum VisibilityJson: String {
    case `public`
    case unlisted
    case `private`
    case direct
}

extension VisibilityJson: Decodable {
}

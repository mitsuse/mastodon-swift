public struct DefaultClient: Client {
    public let configuration: Configuration

    public init(configuration: Configuration) {
        self.configuration = configuration
    }
}

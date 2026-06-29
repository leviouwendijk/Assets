import FileTypes

public struct AssetDataURI: Sendable, Codable, Hashable {
    public let media: FileMediaType
    public let base64: AssetBase64

    public init(
        media: FileMediaType,
        base64: AssetBase64
    ) {
        self.media = media
        self.base64 = base64
    }

    public var value: String {
        "data:\(media.rawValue);base64,\(base64.compact)"
    }
}

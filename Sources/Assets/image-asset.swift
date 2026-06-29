import FileTypes
import Foundation

public struct ImageAsset: Sendable, Codable, Hashable {
    public let identifier: AssetIdentifier
    public let filetype: PhotoFile
    public let base64: AssetBase64
    public let alt: AssetAlt
    public let size: AssetSize?
    public let classes: [AssetClass]

    public init(
        identifier: AssetIdentifier,
        filetype: PhotoFile,
        base64: AssetBase64,
        alt: AssetAlt,
        size: AssetSize? = nil,
        classes: [AssetClass] = []
    ) {
        self.identifier = identifier
        self.filetype = filetype
        self.base64 = base64
        self.alt = alt
        self.size = size
        self.classes = classes
    }

    public var media: FileMediaType {
        filetype.media
    }

    public var uri: AssetDataURI {
        .init(
            media: media,
            base64: base64
        )
    }

    public var data: Data? {
        base64.data
    }

    public var className: String? {
        guard !classes.isEmpty else {
            return nil
        }

        return classes
            .map(\.value)
            .joined(separator: " ")
    }
}

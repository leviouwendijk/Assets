import Foundation

public struct AssetNamespace: Sendable, Codable, Hashable, ExpressibleByStringLiteral {
    public let value: String

    public init(
        _ value: String
    ) {
        self.value = value
    }

    public init(
        stringLiteral value: String
    ) {
        self.value = value
    }
}

public struct AssetName: Sendable, Codable, Hashable, ExpressibleByStringLiteral {
    public let value: String

    public init(
        _ value: String
    ) {
        self.value = value
    }

    public init(
        stringLiteral value: String
    ) {
        self.value = value
    }
}

public struct AssetIdentifier: Sendable, Codable, Hashable {
    public let namespace: AssetNamespace
    public let name: AssetName

    public init(
        namespace: AssetNamespace,
        name: AssetName
    ) {
        self.namespace = namespace
        self.name = name
    }

    public var value: String {
        "\(namespace.value).\(name.value)"
    }
}

public struct AssetBase64: Sendable, Codable, Hashable, ExpressibleByStringLiteral {
    public let raw: String

    public init(
        _ raw: String
    ) {
        self.raw = raw
    }

    public init(
        stringLiteral value: String
    ) {
        self.raw = value
    }

    public var compact: String {
        String(
            raw.filter { character in
                !character.isWhitespace
            }
        )
    }

    public var data: Data? {
        Data(
            base64Encoded: compact,
            options: .ignoreUnknownCharacters
        )
    }
}

public struct AssetAlt: Sendable, Codable, Hashable, ExpressibleByStringLiteral {
    public let value: String

    public init(
        _ value: String
    ) {
        self.value = value
    }

    public init(
        stringLiteral value: String
    ) {
        self.value = value
    }
}

public struct AssetClass: Sendable, Codable, Hashable, ExpressibleByStringLiteral {
    public let value: String

    public init(
        _ value: String
    ) {
        self.value = value
    }

    public init(
        stringLiteral value: String
    ) {
        self.value = value
    }
}

public extension AssetClass {
    static let logo: Self = "logo"
    static let payment_logo: Self = "payment-logo"
}

public struct AssetPixels: Sendable, Codable, Hashable, ExpressibleByIntegerLiteral {
    public let value: Int

    public init(
        _ value: Int
    ) {
        self.value = value
    }

    public init(
        integerLiteral value: Int
    ) {
        self.value = value
    }
}

public struct AssetSize: Sendable, Codable, Hashable {
    public let width: AssetPixels?
    public let height: AssetPixels?

    public init(
        width: AssetPixels? = nil,
        height: AssetPixels? = nil
    ) {
        self.width = width
        self.height = height
    }
}

// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 22/03/2020.
//  All code (c) 2020. - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

public struct SemanticVersion: Codable, Equatable {
    public let major: Int
    public let minor: Int
    public let patch: Int
    
    static var unknown : SemanticVersion = SemanticVersion()
    
    public var isUnknown : Bool { return major == 0 && minor == 0 && patch == 0 }
    public var isInvalid : Bool { return major < 0 || minor < 0 || patch < 0 }

    public init() {
        self.major = 0
        self.minor = 0
        self.patch = 0
    }
    
    public init(_ major: Int = 0, _ minor: Int = 0, _ patch: Int = 0) {
        self.init(major: major, minor: minor, patch: patch)
    }
    
    public init(major: Int, minor: Int, patch: Int) {
        self.major = major
        self.minor = minor
        self.patch = patch
    }

    public init(major: String, minor: String = "0", patch: String = "0") {
        self.major = Int(major) ?? -1
        self.minor = Int(minor) ?? -1
        self.patch = Int(patch) ?? -1
    }

    public init(_ string: String?) {
        if var string = string {
            if string.first == "v" {
                string.remove(at: string.startIndex)
            }

            let items = string.split(separator: ".")
            let count = items.count
            if count > 0 {
                let major = String(items[0])
                let minor = count > 1 ? String(items[1]) : "0"
                let patch = count > 2 ? String(items[2]) : "0"
                self.init(major: major, minor: minor, patch: patch)
                return
            }
        }
        
        self.init(-1, -1, -1)
    }

    public var asString: String {
        return asString(dropTrailingZeros: true)
    }

    public func asString(dropTrailingZeros: Bool = true) -> String {
        guard !isInvalid else {
            return "<invalid>"
        }

        guard !isUnknown else {
            return "<unknown>"
        }
        
        var string = "\(major).\(minor)"
        if !dropTrailingZeros || patch != 0 {
            string += ".\(patch)"
        }
        return string
    }

    public func display(as name: String? = nil, build: Int? = nil) -> String {
        var parts: [String] = []
        if let name = name {
            parts.append(name)
        }
        
        parts.append(asString)
        
        if let build = build {
            parts.append("(\(build))")
        }
        
        return parts.joined(separator: " ")
    }
}

extension SemanticVersion: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
}

extension SemanticVersion: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = Int
    public init(arrayLiteral elements: ArrayLiteralElement...) {
        let count = elements.count
        self.init(count > 0 ? elements[0] : 0, count > 1 ? elements[1] : 0, count > 2 ? elements[2] : 0)
    }
}

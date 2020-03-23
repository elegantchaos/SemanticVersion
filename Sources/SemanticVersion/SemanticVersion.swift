// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 22/03/2020.
//  All code (c) 2020. - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

public struct SemanticVersion: Codable, Equatable {
    public let major: Int
    public let minor: Int
    public let patch: Int

    public var asString: String {
        guard major + minor + patch > 0 else {
            return "<unknown>"
        }
        
        var string = "\(major).\(minor)"
        if patch != 0 {
            string += ".\(patch)"
        }
        return string
    }

    public init(_ major: Int = 0, _ minor: Int = 0, _ patch: Int = 0) {
        self.init(major: major, minor: minor, patch: patch)
    }
    
    public init(major: Int, minor: Int, patch: Int) {
        self.major = major
        self.minor = minor
        self.patch = patch
    }

    public init?(major: String, minor: String = "0", patch: String = "0") {
        guard let iMajor = Int(major), let iMinor = Int(minor), let iPatch = Int(patch) else {
            return nil
        }

        self.major = iMajor
        self.minor = iMinor
        self.patch = iPatch
    }

    public init?(_ string: String) {
        var version = string
        if string.first == "v" {
            version.remove(at: version.startIndex)
        }
        let items = version.split(separator: ".")
        let count = items.count
        guard count > 0 else {
            return nil
        }

        let major = String(items[0])
        let minor = count > 1 ? String(items[1]) : "0"
        let patch = count > 2 ? String(items[2]) : "0"
        self.init(major: major, minor: minor, patch: patch)
    }
}

public func <(x: SemanticVersion, y: SemanticVersion) -> Bool {
    if (x.major < y.major) {
        return true
    } else if (x.major > y.major) {
        return false
    } else if (x.minor < y.minor) {
        return true
    } else if (x.minor > y.minor) {
        return false
    } else {
        return x.patch < y.patch
    }
}

public func >(x: SemanticVersion, y: SemanticVersion) -> Bool {
    return y < x
}

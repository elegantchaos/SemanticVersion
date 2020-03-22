// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 22/03/2020.
//  All code (c) 2020. - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

public struct SemanticVersion: Codable {
    public let major: Int
    public let minor: Int
    public let patch: Int

    public var asString: String {
        var string = "\(major).\(minor)"
        if patch != 0 {
            string += ".\(patch)"
        }
        return string
    }

    public init(_ major: Int, _ minor: Int = 0, _ patch: Int = 0) {
        self.major = major
        self.minor = minor
        self.patch = patch
    }
    
}

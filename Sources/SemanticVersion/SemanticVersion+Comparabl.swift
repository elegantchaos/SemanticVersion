// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 22/08/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

extension SemanticVersion: Comparable {
    public static func < (lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
        if (lhs.major < rhs.major) {
            return true
        } else if (lhs.major > rhs.major) {
            return false
        } else if (lhs.minor < rhs.minor) {
            return true
        } else if (lhs.minor > rhs.minor) {
            return false
        } else {
            return lhs.patch < rhs.patch
        }
    }
}

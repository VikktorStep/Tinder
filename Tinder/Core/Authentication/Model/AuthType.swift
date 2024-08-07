
import Foundation

enum AuthType: Int, Identifiable {
    case careateAccount
    case login
    var id: Int { return self.rawValue }
}


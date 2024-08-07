
import Foundation

struct User: Codable, Identifiable, Hashable {
    let id: String
    let email: String
    let fullname: String
    let age: Int
    var profileImageURLs: [String]
    let occupation: String
    let gender: GenderType
    let orientation: SexualOrientationType
    var didCompleteOnboarding: Bool
}

extension User {
    var firstName: String {
        let components = fullname.components(separatedBy: " ")
        return components[0]
    }
}

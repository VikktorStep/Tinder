
import Foundation

enum GenderType: Int, CaseIterable, Codable {
    case man
    case woman
}

extension GenderType: Identifiable {
    var id: Int { return self.rawValue }
}

extension GenderType {
    var description: String {
        switch self {
        case .man:
            return "Man"
        case .woman:
            return "Woman"
        }
    }
}

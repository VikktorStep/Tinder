
import Foundation

struct Match: Codable, Identifiable, Hashable {
    let id: String
    let userId: String
    let timestamp: Date
    
    var user: User?
}

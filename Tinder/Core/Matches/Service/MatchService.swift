
import Foundation

protocol MatchServiceProtocol {
    func fetchMatches() async throws -> [Match]
}

struct MatchService: MatchServiceProtocol {
    func fetchMatches() async throws -> [Match] {
        //fetchMatches from firebase
        return []
    }
}

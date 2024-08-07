
import Foundation

struct MockMatchService: MatchServiceProtocol {
    func fetchMatches() async throws -> [Match] {
        return MockData.matches
    }
}

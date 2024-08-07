
import Foundation

protocol AuthServiceProtocol {
    func crateUser(withEmail email: String, password: String) async throws -> String
    func login(withEmail email: String, password: String) async throws -> String
    func signOut()
}

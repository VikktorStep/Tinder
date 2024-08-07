
import Foundation

struct MockAuthService: AuthServiceProtocol {
    func crateUser(withEmail email: String, password: String) async throws -> String {
        return NSUUID().uuidString
    }
    
    func login(withEmail email: String, password: String) async throws -> String {
        return NSUUID().uuidString
    }
    
    func signOut() {
        
    }
}

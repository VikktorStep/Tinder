
import Firebase

struct UserService {
    func fetchUser(with uid: String) async throws -> User {
        return try await FirestoreConstants.userCollection.document(uid).getDocument(as: User.self)
    }
}

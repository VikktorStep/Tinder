
import FirebaseAuth
import Firebase

struct AuthService: AuthServiceProtocol {
    func crateUser(withEmail email: String, password: String) async throws -> String {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        
        let user = User(
            id: result.user.uid,
            email: email,
            fullname: "",
            age: 0,
            profileImageURLs: [],
            occupation: "",
            gender: .man,
            orientation: .straight,
            didCompleteOnboarding: false
        )
        
        let userData = try Firestore.Encoder().encode(user)
        try await FirestoreConstants.userCollection.document(result.user.uid).setData(userData)
        
        return result.user.uid
    }
    
    func login(withEmail email: String, password: String) async throws -> String {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        return result.user.uid
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEVUG: Failed to log out")
        }
    }
}

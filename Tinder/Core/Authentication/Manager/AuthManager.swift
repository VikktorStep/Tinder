
import FirebaseAuth

@MainActor
class AuthManager: ObservableObject {
    @Published var authType: AuthType?
    @Published var authState: AuthState = .unathenticated
    private let service: AuthServiceProtocol
    
    init(service: AuthServiceProtocol) {
        self.service = service
        
        if let currentUid = Auth.auth().currentUser?.uid {
            self.authState = .authenticated
        }
    }
    
    func authenticate(withEmail email: String, password: String) async {
        guard let authType else { return }
        
        do {
            switch authType {
            case .careateAccount:
                print("DEBUG: Creating Account")
                let uid = try await service.crateUser(withEmail: email, password: password)
                self.authState = .authenticated
            case .login:
                print("DEBUG: Login Account")
                let uid = try await service.login(withEmail: email, password: password)
                self.authState = .authenticated
            }
        } catch {
            print("DEBUG: Failed to auth with error\(error)")
        }
    }
    
    func signOut() {
        self.authState = .unathenticated
        authType = nil
        service.signOut()
    }
}

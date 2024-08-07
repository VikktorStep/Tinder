
import FirebaseAuth

@MainActor
class UserManager: ObservableObject {
    @Published var currentUser: User?
    @Published var loadingState: ContentLoadingState = .loading
    
    let service: UserService
    
    init(service: UserService) {
        self.service = service
    }
    
    func fetchCurrentUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        do {
            self.currentUser = try await service.fetchUser(with: uid)
            print("DEBUG: Current user is \(currentUser?.fullname)")
            loadingState = .complete
        } catch {
            print("DEBUG: Failed to fetch current user with error \(error)")
            loadingState = .error
        }
    }
}

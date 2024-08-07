
import FirebaseAuth
import SwiftUI

@MainActor
class OnboardingManager: ObservableObject {
    @Published var navigationPath = [OnboardingSteps]()
    @Published var fullname = ""
    @Published var occupation = ""
    @Published var birthday = Date()
    @Published var profilePhotos = [UIImage]()
    @Published var gender: GenderType?
    @Published var sexualOrientation: SexualOrientationType?
    
    @Published var currentUser: User?
    @Published var loadingState: ContentLoadingState = .notStarted
    
    private let service: OnboardingService
    private var currentStep: OnboardingSteps?
    
    init(service: OnboardingService) {
        self.service = service
    }
    
    func start() {
        guard let initialStep = OnboardingSteps(rawValue: 0) else { return }
        navigationPath.append(initialStep)
    }
    
    func navigate() {
        self.currentStep = navigationPath.last
        
        guard let index = currentStep?.rawValue else { return }
        guard let nextStep = OnboardingSteps(rawValue: index + 1) else {
            guard let user = createUser() else { return }
            Task { await uploadUserData() }
            return
        }
        
        navigationPath.append(nextStep)
    }
    
    func uploadUserData() async {
        guard let user = createUser() else { return }
        self.loadingState = .loading
        navigationPath.removeAll()
        
        do {
            self.currentUser = try await service.uploadUserData(user, profilePhotos: profilePhotos)
            self.loadingState = .complete
        } catch {
            print("DEBUG: Failed upload user with error \(error)")
            self.loadingState = .error
        }
    }
}

private extension OnboardingManager {
    func createUser() -> User? {
        guard
            let gender,
            let sexualOrientation,
            let id = Auth.auth().currentUser?.uid,
            let email = Auth.auth().currentUser?.email else { return nil }
        
        let ageComponents = Calendar.current.dateComponents([.year], from: birthday, to: Date())
        guard let age = ageComponents.year else { return nil }
        
        return User(
            id: id,
            email: email,
            fullname: fullname,
            age: age,
            profileImageURLs: [],
            occupation: occupation,
            gender: gender,
            orientation: sexualOrientation,
            didCompleteOnboarding: true
        )
    }
}

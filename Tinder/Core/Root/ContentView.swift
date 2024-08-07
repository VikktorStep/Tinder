
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authManager: AuthManager
    @StateObject var userManager = UserManager(service: UserService())
    
    var body: some View {
        Group {
            switch authManager.authState {
            case .unathenticated:
                AuthenticationRootVIew()
                    .environmentObject(AuthDataStore())
            case .authenticated:
                Group {
                    switch userManager.loadingState {
                    case .loading, .notStarted:
                        ProgressView()
                    case .error, .empty:
                        Text("An error occured.")
                    case .complete:
                        if let currentUser = userManager.currentUser, currentUser.didCompleteOnboarding {
                       /* if userManager.currentUser != nil { */ 
                            MainTabView()
                        } else {
                             WelcomeView()
                        }
                    }
                }
                .environmentObject(userManager)
            }
        }
        .task(id: authManager.authState) {
            guard authManager.authState == .authenticated else { return }
            await userManager.fetchCurrentUser()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthManager(service: MockAuthService()))
}

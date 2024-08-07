
import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var userManager: UserManager
    @StateObject var onboardingManger = OnboardingManager(service: OnboardingService())
    
    var body: some View {
        NavigationStack(path: $onboardingManger.navigationPath) {
            Group {
                switch onboardingManger.loadingState {
                case .notStarted,.complete:
                    VStack(spacing: 24) {
                        VStack(alignment: .leading, spacing: 8) {
                            Image(.tinderLogo)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 64)
                            
                            Text("Welcome to Tinder.")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Text("Please follow these house rules.")
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        WelcomeInfoItemView(title: "Be Yourself.", subtitle: "Make sure your photos, age, and bio are true to who you are.")
                        
                        WelcomeInfoItemView(title: "Stay safe.", subtitle: "Don't be too quick to give out personal information.")
                        
                        WelcomeInfoItemView(title: "Play it cool.", subtitle: "Respect others and treat them as you would like to be treated.")
                        
                        WelcomeInfoItemView(title: "Be proactive.", subtitle: "Always report bad behavior.")
                        
                        Spacer()
                        
                        Button {
                            onboardingManger.start()
                        } label: {
                            Text("I agree")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .frame(width: 350, height: 44)
                                .background(.primaryPink)
                                .clipShape(Capsule())
                        }
                    }
                    .navigationDestination(for: OnboardingSteps.self, destination: { step in
                        Group {
                            switch step {
                            case .name:
                                FullNameView()
                            case .birthday:
                                BirthdayView()
                            case .occupation:
                                OccupationView()
                            case .gender:
                                GenderSelectionView()
                            case .sexualOrientation:
                                SexualOrientationSelectionView()
                            case .photos:
                                AddProfilePhotosView()
                            }
                        }
                        .navigationBarBackButtonHidden()
                        .environmentObject(onboardingManger)
                    })
                    .padding()
                case .loading:
                    ProgressView()
                case .error:
                    Text("An error occured")
                default:
                    EmptyView()
                }
            }
            .onChange(of: onboardingManger.currentUser) { oldValue, newValue in
                userManager.currentUser = newValue
            }
        }
    }
}

#Preview {
    WelcomeView()
}

struct WelcomeInfoItemView: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            
            Text(subtitle)
                .foregroundStyle(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.subheadline)
    }
}

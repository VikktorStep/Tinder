
import SwiftUI

struct EmailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var authDataStore: AuthDataStore
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Your email?")
                        .fontWeight(.bold)
                        .font(.title)
                    
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                    
                    TextField("Your Email", text: $authDataStore.email)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .keyboardType(.emailAddress)
                    
                    Divider()
                }
                .padding()
                
                Spacer()
                
                NavigationLink {
                    PasswordView()
                } label: {
                    Text("Next")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(width: 320, height: 50)
                        .background(.primaryPink)
                        .clipShape(Capsule())
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .fontWeight(.heavy)
                            .foregroundStyle(Color(.primaryText))
                    }
                }
            }
        }
    }
}

private extension EmailView {
    var subtitle: String {
        guard let authType = authManager.authType else { return "" }
        
        switch authType {
        case .careateAccount:
            return "Don't lose access to your account, add your email."
        case .login:
            return "Enter the email associated with your account to log back in"
        }
    }
}

#Preview {
    EmailView()
        .environmentObject(AuthManager(service: MockAuthService()))
}

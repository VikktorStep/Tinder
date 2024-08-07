
import SwiftUI

struct NextButton: View {
    @EnvironmentObject var manager: OnboardingManager
    let formIsValid: Bool
    
    var body: some View {
        Button {
            manager.navigate()
        } label: {
            Text("Next")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(formIsValid ? .white : .black.opacity(0.5))
                .frame(width: 350, height: 44)
                .background(formIsValid ? .primaryPink : Color(.systemGray5))
                .clipShape(Capsule())
        }
        .disabled(!formIsValid)
    }
}

#Preview {
    VStack {
        NextButton(formIsValid: true)
        NextButton(formIsValid: false)
    }
    .environmentObject(OnboardingManager(service: OnboardingService()))
}

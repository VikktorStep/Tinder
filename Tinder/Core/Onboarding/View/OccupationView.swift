
import SwiftUI

struct OccupationView: View {
    @EnvironmentObject var manager: OnboardingManager
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("What's your occupation?")
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading) {
                    TextField("Enter your occupation", text: $manager.occupation)
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("This is how it'll appear in your profile.")
                            .opacity(0.6)
                        
                        Text("You can modify this later.")
                            .font(.footnote)
                            .bold()
                    }
                    .padding(.top, 8)
                    .font(.footnote)
                }
            }
            
            Spacer()
            
            NextButton(formIsValid: formIsValid)

        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton()
            }
        }
    }
}

extension OccupationView: FormValidatorProtocol {
    var formIsValid: Bool {
        return !manager.occupation.isEmpty
    }
}

#Preview {
    NavigationStack {
        OccupationView()
    }
}

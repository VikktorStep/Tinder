
import SwiftUI

struct FullNameView: View {
    @EnvironmentObject var manager: OnboardingManager
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("What's your full name?")
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading) {
                    TextField("Enter Full Name", text: $manager.fullname)
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("This is how it'll appear in your profile.")
                            .opacity(0.6)
                        
                        Text("Can't change it later.")
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

extension FullNameView: FormValidatorProtocol {
    var formIsValid: Bool {
        return manager.fullname.count > 2
    }
}

#Preview {
    NavigationStack {
        FullNameView()
    }
}

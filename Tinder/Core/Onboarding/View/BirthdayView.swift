
import SwiftUI

struct BirthdayView: View {
    @EnvironmentObject var manager: OnboardingManager
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("When's your birthday?")
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading) {
                    DatePicker(
                        "picker date",
                        selection: $manager.birthday,
                        displayedComponents: [.date]
                    )
                }
                .datePickerStyle(.graphical)
                
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

extension BirthdayView: FormValidatorProtocol {
    var formIsValid: Bool {
        return true
    }
}

#Preview {
    NavigationStack {
        BirthdayView()
    }
}


import SwiftUI

struct GenderSelectionView: View {
    @EnvironmentObject var manager: OnboardingManager
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 20) {
                Text("What's your gender?")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("We value and support diversity and inclusion of all genders. We will add more options to include everyone soon.")
                    .font(.subheadline)
            }
            
            ForEach(GenderType.allCases) { gender in
                
                Button {
                    manager.gender = gender
                } label: {
                    Text("\(gender.description)")
                        .foregroundStyle(.primaryText)
                        .frame(width: 300, height: 50)
                        .overlay(RoundedRectangle(cornerRadius: 25)  .stroke(manager.gender == gender ? .red : .gray, lineWidth: 1.5))
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

extension GenderSelectionView: FormValidatorProtocol {
    var formIsValid: Bool {
        return manager.gender != nil
    }
}

#Preview {
    NavigationStack {
        GenderSelectionView()
    }
}

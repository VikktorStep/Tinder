
import SwiftUI

struct SexualOrientationSelectionView: View {
    @EnvironmentObject var manager: OnboardingManager
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("What's your sexual orientation?")
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(SexualOrientationType.allCases) { orientation in
                        Button {
                            manager.sexualOrientation = orientation
                        } label: {
                            HStack {
                                Text(orientation.description)
                                
                                Spacer()
                                
                                if manager.sexualOrientation == orientation {
                                    Image(systemName: "checkmark")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 14, height: 14)
                                }
                            }
                            .foregroundStyle(.primaryText)
                        }
                    }
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

extension SexualOrientationSelectionView: FormValidatorProtocol {
    var formIsValid: Bool {
        return manager.sexualOrientation != nil
    }
}

#Preview {
    NavigationStack {
        SexualOrientationSelectionView()
    }
}

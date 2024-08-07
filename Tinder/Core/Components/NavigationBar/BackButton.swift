
import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
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

#Preview {
    BackButton()
}

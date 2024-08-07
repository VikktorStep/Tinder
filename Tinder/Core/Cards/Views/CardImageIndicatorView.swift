
import SwiftUI

struct CardImageIndicatorView: View {
    let currentImageIndex: Int
    let countImage: Int
    
    var body: some View {
        HStack {
            ForEach(0 ..< countImage, id: \.self) { index in
                Capsule()
                    .foregroundStyle(currentImageIndex == index ? .white : .gray)
                    .frame(width: imageIndicatorWidth, height: 4)
                    .padding(.top, 8)
            }
        }
    }
}

private extension CardImageIndicatorView {
    var imageIndicatorWidth: CGFloat {
        return SizeConstants.cardWidth / CGFloat(countImage) - 28
    }
} //ViewModel probably

#Preview {
    CardImageIndicatorView(currentImageIndex: 1, countImage: 4)
        .preferredColorScheme(.dark)
}


import SwiftUI

struct SwipeActionButtonsView: View {
    @ObservedObject var viewModel: CardsViewModel
    
    var body: some View {
        HStack(spacing: 32) {
            ActionButtonView(imageName: "xmark", foregroundColor:.red, action: {
                viewModel.buttonSwipeAction = .reject
            })
                .frame(width: 48, height: 48)
            
            ActionButtonView(imageName: "heart.fill", foregroundColor:.green, action: {
                viewModel.buttonSwipeAction = .like
            })
                .frame(width: 48, height: 48)
        }
    }
}

private extension SwipeActionButtonsView {
    struct ActionButtonView: View {
        let imageName: String
        let foregroundColor: Color
        let action: () -> Void
        
        var body: some View {
            Button(action: action) {
                Image(systemName: imageName)
                    .fontWeight(.heavy)
                    .foregroundStyle(foregroundColor)
                    .background(
                        Circle()
                            .fill(Color.white)
                            .frame(width: 48, height: 48)
                            .shadow(radius: 6))
            }
        }
    }
}

#Preview {
    SwipeActionButtonsView(viewModel: CardsViewModel(service: CardService()))
}


//var body: some View {
//    HStack(spacing: 32) {
//        Button {
//
//        } label: {
//            Image(systemName: "xmark")
//                .fontWeight(.heavy)
//                .foregroundStyle(.red)
//                .background {
//                    Circle()
//                        .fill(.white)
//                        .frame(width: 48, height: 48)
//                        .shadow(radius: 6)
//                }
//        }
//        .frame(width: 48, height: 48)
//
//        Button {
//
//        } label: {
//            Image(systemName: "heart.fill")
//                .fontWeight(.heavy)
//                .foregroundStyle(.green)
//                .background {
//                    Circle()
//                        .fill(.white)
//                        .frame(width: 48, height: 48)
//                        .shadow(radius: 6)
//                }
//        }
//        .frame(width: 48, height: 48)
//    }
//}

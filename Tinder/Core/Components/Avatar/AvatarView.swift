
import SwiftUI
import Kingfisher

struct AvatarView: View {
    
    let user: User?
    
    var body: some View {
        if let imageUrl = user?.profileImageURLs.first {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .clipShape(.circle)
                .shadow(radius: 4)
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(.circle)
                .shadow(radius: 4)
        }
    }
}

#Preview {
    AvatarView(user: MockData.users[0])
}


import SwiftUI

struct MainTabView: View {
    @StateObject var matchManager = MatchManager(service: MockMatchService())
    var body: some View {
        TabView {
            CardStackView()
                .tabItem { Image(systemName: "flame") }
                .tag(0)
            
            Text("Searh View")
                .tabItem { Image(systemName: "magnifyingglass") }
                .tag(1)
            
            InboxView()
                .tabItem {
                    Image(.messagesIcon)
                        .renderingMode(.template)
                }
                .tag(2)
            
            CurrentUserProfileView()
                .tabItem { Image(systemName: "person") }
                .tag(3)
        }
        .environmentObject(matchManager)
        .tint(.primary)
    }
}

#Preview {
    MainTabView()
        .environmentObject(MatchManager(service: MockMatchService()))
}

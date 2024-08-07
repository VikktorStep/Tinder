//
//  CurrentUserProfile.swift
//  Tinder
//
//  Created by Mac on 24.06.2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var userManager: UserManager
    
    @State private var showEditProfile = false
  
    private var user: User? {
        return userManager.currentUser
    }
    
    var body: some View {
        NavigationStack {
            List {
                if let user {
                    CurrentUserHeaderProfileView(user: user)
                        .onTapGesture { showEditProfile.toggle()}
                }
                
                Section("Account Information") {
                    HStack {
                        Text("Name")
                        
                        Spacer()
                        
                        Text(user?.fullname ?? "")
                    }
                    
                    HStack {
                        Text("Email")
                        
                        Spacer()
                        
                        Text(user?.email ?? "")
                    }
                }
                
                Section("Legal"){
                    Text("Terms of service")
                }
                
                Section {
                    Button("Logout") {
                        authManager.signOut()
                        userManager.currentUser = nil
                    }
                }
                .foregroundStyle(.red)
                
                Section {
                    Button("Delete Account") {
                        print("DEBIG: Delete account here...")
                    }
                }
                .foregroundStyle(.red)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $showEditProfile) {
                if let user {
                    EditProfileView(user: user)
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView()
}

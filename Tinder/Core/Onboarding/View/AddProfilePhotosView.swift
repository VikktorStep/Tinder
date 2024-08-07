
import SwiftUI
import PhotosUI

struct AddProfilePhotosView: View {
    @EnvironmentObject var manager: OnboardingManager
    @State private var selectedPhotosItem = [PhotosPickerItem]()
    @State private var profileImages = [Image]()
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Add ypur recent pics")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("The first photo will be you main profile picture")
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            PhotosPicker(selection: $selectedPhotosItem,
                         maxSelectionCount: maxSelectionCount,
                         selectionBehavior: .ordered) {
                LazyVGrid(columns: colums, spacing: 12) {
                    ForEach(0 ... maxSelectionCount - 1, id: \.self) { index in
                        if index < profileImages.count {
                            profileImages[index]
                                .resizable()
                                .scaledToFill()
                                .frame(width: 110, height: 160)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        } else {
                            ZStack(alignment: .bottomTrailing) {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(.secondarySystemBackground))
                                    .frame(width: 110, height: 160)
                                
                                Image(systemName: "plus.circle.fill")
                                    .imageScale(.large)
                                    .foregroundStyle(.primaryText)
                                    .offset(x: 8, y: 4)
                            }
                        }
                    }
                }
            }
            
            Spacer()
            
            HStack {
                ZStack {
                    Circle()
                        .stroke(Color(.systemGray3), lineWidth: 2)
                        .frame(width: 48, height: 48)
                    
                    Text("\(profileImages.count) / \(maxSelectionCount)")
                        .fontWeight(.semibold)
                }
                
                Text("Hey! Let's add 2 to start. We reccomend a face pic.")
            }
            .font(.subheadline)
            
            NextButton(formIsValid: formIsValid)
        }
        .padding()
        .onChange(of: selectedPhotosItem) { oldValue, newValue in
            loadProfilePhoto()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton()
            }
        }
    }
}

extension AddProfilePhotosView: FormValidatorProtocol {
    var formIsValid: Bool {
        return profileImages.count > 1
    }
}


private extension AddProfilePhotosView {
    var colums: [GridItem] {
        return Array(repeating: .init(), count: 3)
    }
    
    var maxSelectionCount: Int {
        return 6
    }
    
    func loadProfilePhoto() {
        Task {
            var images = [UIImage]()
            
            for item in selectedPhotosItem {
                guard let iamgeData = try? await item.loadTransferable(type: Data.self) else { return }
                guard let uiImage = UIImage(data: iamgeData) else { return }
                images.append(uiImage)
            }
            self.profileImages = images.map({ Image(uiImage: $0) })
            manager.profilePhotos = images  
        }
    }
}

#Preview {
    NavigationStack {
        AddProfilePhotosView()
    }
}

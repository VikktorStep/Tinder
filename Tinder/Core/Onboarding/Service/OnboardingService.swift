
import Firebase
import FirebaseFirestoreSwift

enum UserError: Error {
    case invalidUser
}

struct OnboardingService {
    func uploadUserData(_ user: User, profilePhotos: [UIImage]) async throws -> User {
        guard let uid = Auth.auth().currentUser?.uid else { throw UserError.invalidUser }
        var result = user
        
        let userData = try Firestore.Encoder().encode(user)
        try await FirestoreConstants.userCollection.document(uid).setData(userData)
        let imageURLs = try await uploadUserPhotos(profilePhotos)
        result.profileImageURLs.append(contentsOf: imageURLs)
        return result
    }
    
    func uploadUserPhotos(_ photos: [UIImage]) async throws -> [String] {
        guard let uid = Auth.auth().currentUser?.uid else { return [] }
        
        return try await withThrowingTaskGroup(of: String.self) { group in
            var result = [String]()
            
            for photo in photos {
                group.addTask { return try await ImageUploader().uploadImage(photo) }
            }
            
            for try await imageUrl in group {
                result.append(imageUrl)
                
                try await FirestoreConstants.userCollection.document(uid).updateData([
                    "profileImageURLs": FieldValue.arrayUnion([imageUrl])
                ])
            }
            
            return result
        }
    }
}

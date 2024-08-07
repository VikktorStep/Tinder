
import UIKit
import FirebaseStorage

enum ImageUploaderError: Error {
    case invalidData
}

struct ImageUploader {
    func uploadImage(_ image: UIImage) async throws -> String {
        guard let imageData = image.jpegData(compressionQuality: 0.4) else { throw ImageUploaderError.invalidData }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        let _ = try await ref.putDataAsync(imageData)
        let url = try await ref.downloadURL()
        return url.absoluteString
    }
}

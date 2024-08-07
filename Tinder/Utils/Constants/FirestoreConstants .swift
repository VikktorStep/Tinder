
import FirebaseFirestore

struct FirestoreConstants {
    private static let root = Firestore.firestore()
    
    static let userCollection = root.collection("users")
}

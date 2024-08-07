
import Foundation

struct MockData {
    static let users: [User] = [
        .init(
            id: NSUUID().uuidString,
            email: "megan@gmail.com",
            fullname: "Megan Fox",
            age: 37,
            profileImageURLs: ["megan-fox-1", "megan-fox-2"],
            occupation: "Actress",
            gender: .woman,
            orientation: .straight,
            didCompleteOnboarding: false
        ),
        .init(
            id: NSUUID().uuidString,
            email: "kelly@gmail.com",
            fullname: "Kelly Johnson",
            age: 37,
            profileImageURLs: ["megan-fox-1", "megan-fox-2"],
            occupation: "Actress",
            gender: .woman,
            orientation: .straight,
            didCompleteOnboarding: false
        ),
        .init(
            id: NSUUID().uuidString,
            email: "megan@gmail.com",
            fullname: "Megan Fox",
            age: 37,
            profileImageURLs: ["kelly1", "kelly2", "kelly3"],
            occupation: "DJ",
            gender: .woman,
            orientation: .straight,
            didCompleteOnboarding: false
        ),
        .init(
            id: NSUUID().uuidString,
            email: "jane@gmail.com",
            fullname: "Jane Doe",
            age: 37,
            profileImageURLs: ["jane1", "jane2", "jane3"],
            occupation: "Analyst",
            gender: .woman,
            orientation: .bisexual,
            didCompleteOnboarding: false
        ),
        .init(
            id: NSUUID().uuidString,
            email: "david@gmail.com",
            fullname: "David Beckham",
            age: 37,
            profileImageURLs: ["david-beckham-1", "david-beckham-2"],
            occupation: "EX-Athlete",
            gender: .man,
            orientation: .straight,
            didCompleteOnboarding: false
        ),
        .init(
            id: NSUUID().uuidString,
            email: "conor@gmail.com",
            fullname: "Conor Mcgregor",
            age: 37,
            profileImageURLs: ["conor-mcgregor-1", "conor-mcgregor-2", "conor-mcgregor-3"],
            occupation: "Professional Fighter",
            gender: .man,
            orientation: .straight,
            didCompleteOnboarding: false
        )
    ]
}

extension MockData {
    static var matches: [Match] = [
        .init(
            id: NSUUID().uuidString,
            userId: users[0].id,
            timestamp: Date(),
            user: users[0]
        ),
        .init(
            id: NSUUID().uuidString,
            userId: users[2].id,
            timestamp: Date(),
            user: users[2]
        ),
        .init(
            id: NSUUID().uuidString,
            userId: users[3].id,
            timestamp: Date(),
            user: users[3]
        )
        
    ]
}

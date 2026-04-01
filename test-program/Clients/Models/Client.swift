import Foundation

struct Client: Identifiable, Hashable {
    let id: UUID
    let name: String
    let email: String
    let phone: String
    let address: String

    init(
        id: UUID = UUID(),
        name: String,
        email: String = "",
        phone: String = "",
        address: String = ""
    ) {
        self.id = id
        self.name = name
        self.email = email
        self.phone = phone
        self.address = address
    }
}

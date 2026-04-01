import Foundation
import Combine

final class ClientsStore: ObservableObject {
    @Published private(set) var clients: [Client] = []

    func addClient(_ client: Client) {
        clients.insert(client, at: 0)
    }
}

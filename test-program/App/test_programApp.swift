import SwiftUI

@main
struct TestProgramApp: App {
    @StateObject private var clientsStore = ClientsStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
                .environmentObject(clientsStore)
        }
    }
}

import Foundation
import Combine

final class ContentViewModel: ObservableObject {
    @Published var navigationPath: [AppRoute] = []

    func openBusinessSetup() {
        navigationPath.append(.businessSetup)
    }
}

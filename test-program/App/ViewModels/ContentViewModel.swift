import Foundation
import Combine
import SwiftUI

enum AppRootScreen {
    case onboarding
    case mainApp
}

final class ContentViewModel: ObservableObject {
    @Published var rootScreen: AppRootScreen = .onboarding
    @Published var navigationPath: [AppRoute] = []

    func openBusinessSetup() {
        guard navigationPath.last != .businessSetup else {
            return
        }
        navigationPath.append(.businessSetup)
    }

    func openSubscription() {
        guard navigationPath.last != .subscription else {
            return
        }
        navigationPath.append(.subscription)
    }

    func openMainApp() {
        withAnimation(.easeInOut(duration: 0.3)) {
            navigationPath.removeAll()
            rootScreen = .mainApp
        }
    }
}

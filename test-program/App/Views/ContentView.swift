import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            onboardingScreen
                .navigationDestination(for: AppRoute.self, destination: destinationView)
        }
    }

    private var onboardingScreen: some View {
        OnboardingView(onFinish: viewModel.openBusinessSetup)
    }

    @ViewBuilder
    private func destinationView(for route: AppRoute) -> some View {
        switch route {
        case .businessSetup:
            RegistrationView()
        }
    }
}

#Preview {
    ContentView()
}

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        ZStack {
            switch viewModel.rootScreen {
            case .onboarding:
                onboardingFlow
                    .transition(.opacity)
            case .mainApp:
                RootTabView()
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.3), value: viewModel.rootScreen)
    }

    private var onboardingFlow: some View {
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
            RegistrationView(onComplete: viewModel.openSubscription)
        case .subscription:
            SubscriptionView(onContinue: viewModel.openMainApp)
        }
    }
}

#Preview {
    ContentView()
}

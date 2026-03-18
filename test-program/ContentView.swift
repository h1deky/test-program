import SwiftUI

struct ContentView: View {
    @State private var navigationPath: [Screen] = []
    
    enum Screen: Hashable {
        case onboarding
        case businessSetup
    }
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            OnboardingView(navigationPath: $navigationPath)
                .navigationDestination(for: Screen.self) { screen in
                    switch screen {
                    case .onboarding:
                        OnboardingView(navigationPath: $navigationPath)
                    case .businessSetup:
                        RegistrationView()
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}

import Foundation
import Combine

final class RegistrationViewModel: ObservableObject {
    @Published var form = BusinessSetupForm()
    @Published var isBusinessSetupComplete = false

    var canContinue: Bool {
        form.canContinue
    }

    func completeSetup() {
        isBusinessSetupComplete = true
    }
}

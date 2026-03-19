import Foundation
import Combine

final class RegistrationViewModel: ObservableObject {
    @Published var form = BusinessSetupForm()

    var canContinue: Bool {
        form.canContinue
    }

    func completeSetup() {
        // Business setup persistence will be added here later.
    }
}

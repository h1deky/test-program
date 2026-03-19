import Foundation
import Combine

final class OnboardingViewModel: ObservableObject {
    let pages = OnboardingPage.allCases

    @Published var currentPage = 0

    var isLastPage: Bool {
        currentPage == pages.count - 1
    }

    var primaryButtonTitle: String {
        isLastPage ? "Get Started" : "Continue"
    }

    func moveForward() {
        guard !isLastPage else {
            return
        }
        currentPage += 1
    }
}

import Foundation
import Combine

final class RootTabViewModel: ObservableObject {
    @Published var selectedTab: MainTab = .home
}

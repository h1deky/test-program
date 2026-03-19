import Foundation
import Combine

enum EstimateSheet: String, Identifiable {
    case catalog
    case taxDiscount
    case addItem

    var id: String {
        rawValue
    }

    var title: String {
        switch self {
        case .catalog:
            return "Catalog"
        case .taxDiscount:
            return "Tax & Discount"
        case .addItem:
            return "Add Item"
        }
    }

    var message: String {
        switch self {
        case .catalog:
            return "Каталог пока заглушка."
        case .taxDiscount:
            return "Налоги/скидки пока заглушка."
        case .addItem:
            return "Добавление позиции пока заглушка."
        }
    }
}

final class NewEstimateViewModel: ObservableObject {
    @Published var selectedTab: DocumentComposerTab = .draft
    @Published var estimateNumber = "EST-1001"
    @Published var issueDate = ""
    @Published var dueDate = ""
    @Published var clientName = ""

    @Published var itemName = ""
    @Published var qty = "1"
    @Published var rate = "0"
    @Published var unit = ""
    @Published var isTaxable = true

    @Published var notes = ""
    @Published var presentedSheet: EstimateSheet?

    func openCatalog() {
        presentedSheet = .catalog
    }

    func openTaxDiscount() {
        presentedSheet = .taxDiscount
    }

    func openAddItem() {
        presentedSheet = .addItem
    }
}

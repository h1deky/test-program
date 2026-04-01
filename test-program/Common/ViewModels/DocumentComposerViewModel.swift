import Foundation
import Combine

enum DocumentComposerKind {
    case invoice
    case estimate

    var navigationTitle: String {
        switch self {
        case .invoice:
            return "New Invoice"
        case .estimate:
            return "New Estimate"
        }
    }

    var numberTitle: String {
        switch self {
        case .invoice:
            return "Invoice Number"
        case .estimate:
            return "Estimate Number"
        }
    }

    var defaultNumber: String {
        switch self {
        case .invoice:
            return "INV-1001"
        case .estimate:
            return "EST-1001"
        }
    }

    var previewTitle: String {
        switch self {
        case .invoice:
            return "Invoice Preview"
        case .estimate:
            return "Estimate Preview"
        }
    }

    var sendTitle: String {
        switch self {
        case .invoice:
            return "Send Invoice"
        case .estimate:
            return "Send Estimate"
        }
    }

    var primarySendActionTitle: String {
        switch self {
        case .invoice:
            return "Send Invoice"
        case .estimate:
            return "Send by Email"
        }
    }

    var primarySendActionSubtitle: String {
        switch self {
        case .invoice:
            return "Prepare invoice for delivery"
        case .estimate:
            return "Prepare estimate for email delivery"
        }
    }
}

enum DocumentComposerSheet: String, Identifiable {
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

    func message(for kind: DocumentComposerKind) -> String {
        switch (kind, self) {
        case (.invoice, .catalog):
            return "Каталог товаров и услуг пока заглушка."
        case (.invoice, .taxDiscount):
            return "Настройка налогов и скидок пока заглушка."
        case (.invoice, .addItem):
            return "Добавление позиции пока заглушка."
        case (.estimate, .catalog):
            return "Каталог пока заглушка."
        case (.estimate, .taxDiscount):
            return "Налоги и скидки пока заглушка."
        case (.estimate, .addItem):
            return "Добавление позиции пока заглушка."
        }
    }
}

final class DocumentComposerViewModel: ObservableObject {
    let kind: DocumentComposerKind

    @Published var selectedTab: DocumentComposerTab = .draft
    @Published var documentNumber: String
    @Published var issueDate = ""
    @Published var dueDate = ""
    @Published var clientName = ""
    @Published var itemName = ""
    @Published var qty = "1"
    @Published var rate = "0"
    @Published var unit = ""
    @Published var isTaxable = true
    @Published var notes = ""
    @Published var presentedSheet: DocumentComposerSheet?

    init(kind: DocumentComposerKind) {
        self.kind = kind
        self.documentNumber = kind.defaultNumber
    }

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

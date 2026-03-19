import Foundation

enum DocumentRoute: Hashable {
    case newInvoice
    case newEstimate
}

enum DocumentTab: Int, CaseIterable, Identifiable {
    case invoices
    case estimates

    var id: Int {
        rawValue
    }

    var title: String {
        switch self {
        case .invoices:
            return "Invoices"
        case .estimates:
            return "Estimates"
        }
    }
}

struct DocumentEmptyState {
    let icon: String
    let title: String
    let subtitle: String
    let buttonTitle: String
}

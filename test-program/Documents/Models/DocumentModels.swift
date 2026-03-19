import Foundation

enum DocumentRoute: String, Identifiable {
    case newInvoice
    case newEstimate

    var id: String {
        rawValue
    }
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

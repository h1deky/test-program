import Foundation

enum OnboardingPage: String, CaseIterable, Identifiable {
    case createInvoices = "doc.text"
    case sendPDF = "paperplane"
    case getPaid = "chart.xyaxis.line"

    var id: String {
        rawValue
    }

    var iconName: String {
        rawValue
    }

    var title: String {
        switch self {
        case .createInvoices:
            return "Create invoices in 30 sec"
        case .sendPDF:
            return "Send PDF instantly"
        case .getPaid:
            return "Track paid/overdue"
        }
    }

    var description: String {
        switch self {
        case .createInvoices:
            return "Quickly generate professional\ninvoices with your business details,\nline items, and taxes."
        case .sendPDF:
            return "Share polished PDF invoices via email or\nany app directly from your phone."
        case .getPaid:
            return "Stay on top of your cash flow. See\nwhat's paid, outstanding, and overdue at a glance."
        }
    }
}

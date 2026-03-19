import Foundation

enum DashboardSheet: String, Identifiable {
    case newInvoice
    case estimate

    var id: String {
        rawValue
    }
}

struct DashboardStatItem: Identifiable {
    let id: String
    let icon: String
    let iconColorHex: String
    let title: String
    let value: String
}

struct DashboardActionItem: Identifiable {
    let id: String
    let icon: String
    let title: String
    let destination: DashboardSheet
}

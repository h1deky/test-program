import Foundation
import Combine
import SwiftUI

final class DashboardViewModel: ObservableObject {
    @Published var presentedSheet: DashboardSheet?

    let stats: [DashboardStatItem] = [
        DashboardStatItem(id: "outstanding", icon: "dollarsign.circle.fill", iconColorHex: "#007AFF", title: "Outstanding", value: "$0.00"),
        DashboardStatItem(id: "paid", icon: "clock.fill", iconColorHex: "#33B54A", title: "Paid (month)", value: "$0.00"),
        DashboardStatItem(id: "overdue", icon: "exclamationmark.triangle.fill", iconColorHex: "#FF3B30", title: "Overdue", value: "0")
    ]

    let actions: [DashboardActionItem] = [
        DashboardActionItem(id: "newInvoice", icon: "doc.text.fill", title: "New Invoice", destination: .newInvoice),
        DashboardActionItem(id: "newEstimate", icon: "ecg.text.page.fill", title: "New Estimate", destination: .estimate)
    ]

    func open(_ sheet: DashboardSheet) {
        presentedSheet = sheet
    }

    func openPrimaryInvoiceFlow() {
        open(.newInvoice)
    }
}

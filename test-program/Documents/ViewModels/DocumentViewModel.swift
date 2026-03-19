import Foundation
import Combine

final class DocumentViewModel: ObservableObject {
    @Published var selectedTab: DocumentTab = .invoices
    @Published var searchQuery = ""
    @Published var path: [DocumentRoute] = []

    var segmentedItems: [String] {
        DocumentTab.allCases.map(\.title)
    }

    var emptyState: DocumentEmptyState {
        switch selectedTab {
        case .invoices:
            return DocumentEmptyState(
                icon: "doc",
                title: "No invoices yet",
                subtitle: "Create your first invoice to get started",
                buttonTitle: "Create First Invoice"
            )
        case .estimates:
            return DocumentEmptyState(
                icon: "doc.text",
                title: "No estimates yet",
                subtitle: "Create your first estimate to get started",
                buttonTitle: "Create First Estimate"
            )
        }
    }

    func selectTab(with rawValue: Int) {
        guard let tab = DocumentTab(rawValue: rawValue) else {
            return
        }
        selectedTab = tab
    }

    func openComposer() {
        let route: DocumentRoute = selectedTab == .invoices ? .newInvoice : .newEstimate
        push(route)
    }

    func push(_ route: DocumentRoute) {
        path.removeAll(keepingCapacity: true)
        path.append(route)
    }
}

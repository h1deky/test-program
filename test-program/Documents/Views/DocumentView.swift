import SwiftUI

struct DocumentView: View {
    @StateObject private var viewModel = DocumentViewModel()

    var body: some View {
        NavigationStack(path: $viewModel.path) {
            VStack(spacing: 0) {
                headerSection
                segmentedControlSection
                searchSection
                contentSection
            }
            .navigationDestination(for: DocumentRoute.self, destination: destinationView)
        }
    }

    private var headerSection: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 2) {
                Text("Documents")
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundColor(.black)
            }

            Spacer()

            Button(action: viewModel.openComposer) {
                Image(systemName: "plus")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
                    .background(Color.black)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
    }

    private var segmentedControlSection: some View {
        CustomSegmentedControl(selection: segmentedSelection, items: viewModel.segmentedItems)
    }

    private var searchSection: some View {
        searchField(searchText: $viewModel.searchQuery)
            .padding(.horizontal, 16)
    }

    private var contentSection: some View {
        ScrollView {
            VStack(spacing: 16) {
                Spacer()
                emptyStateSection
                    .padding(.horizontal, 20)
            }
        }
    }

    private var emptyStateSection: some View {
        EmptyDocumentView(
            docIcon: viewModel.emptyState.icon,
            docTitleMain: viewModel.emptyState.title,
            docTitleSecondary: viewModel.emptyState.subtitle,
            docButtonText: viewModel.emptyState.buttonTitle,
            onCreate: viewModel.openComposer
        )
    }

    private var segmentedSelection: Binding<Int> {
        Binding(
            get: { viewModel.selectedTab.rawValue },
            set: { viewModel.selectTab(with: $0) }
        )
    }

    @ViewBuilder
    private func destinationView(for route: DocumentRoute) -> some View {
        switch route {
        case .newInvoice:
            NewInvoiceView()
        case .newEstimate:
            NewEstimateView()
        }
    }

    private func searchField(searchText: Binding<String>) -> some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 8)

            TextField("Search", text: searchText)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.gray)
                .padding(12)
        }
        .background(Color(.systemGray5))
        .cornerRadius(12)
    }
}

#Preview {
    DocumentView()
}

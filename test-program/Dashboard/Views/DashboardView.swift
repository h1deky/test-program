import SwiftUI

struct DashboardView: View {
    @StateObject private var viewModel = DashboardViewModel()

    var body: some View {
        VStack(spacing: 0) {
            headerSection
            contentSection
        }
        .sheet(item: $viewModel.presentedSheet, content: sheetView)
    }

    private var headerSection: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 2) {
                Text("Dashboard")
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundColor(.black)
            }

            Spacer()

            Button {
                viewModel.openPrimaryInvoiceFlow()
            } label: {
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

    private var contentSection: some View {
        ScrollView {
            VStack(spacing: 24) {
                statsCardsSection
                actionCardsSection
                recentDocumentsSection
                emptyStateSection
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .padding(.bottom, 40)
        }
    }

    private var statsCardsSection: some View {
        HStack(spacing: 12) {
            ForEach(viewModel.stats) { stat in
                StatCard(
                    icon: stat.icon,
                    iconColor: Color.fromHex(stat.iconColorHex),
                    title: stat.title,
                    value: stat.value
                )
            }
        }
    }

    private var actionCardsSection: some View {
        HStack(spacing: 12) {
            ForEach(viewModel.actions) { action in
                ActionCard(
                    icon: action.icon,
                    title: action.title,
                    onTap: { viewModel.open(action.destination) }
                )
            }
        }
    }

    private var recentDocumentsSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Recent Documents")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.black)
        }
    }

    private var emptyStateSection: some View {
        EmptyDocumentView(
            docIcon: "doc",
            docTitleMain: "No documents yet",
            docTitleSecondary: "Create your first invoice to get started",
            docButtonText: "Create First Invoice",
            onCreate: viewModel.openPrimaryInvoiceFlow
        )
    }

    @ViewBuilder
    private func sheetView(for sheet: DashboardSheet) -> some View {
        switch sheet {
        case .newInvoice:
            NewInvoiceView()
        case .estimate:
            NewEstimateView()
        }
    }
}

#Preview {
    DashboardView()
}

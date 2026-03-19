import SwiftUI

struct DocumentView: View {
    @State private var selectedTab = 0
    @State private var searchQuery: String = ""
    @State private var path: [Route] = []

    private enum Route: Hashable {
        case newInvoice
        case newEstimate
    }

    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 0) {
                headerSection

                CustomSegmentedControl(selection: $selectedTab)

                searchField(searchText: $searchQuery)
                    .padding(.horizontal, 16)

                ScrollView {
                    VStack(spacing: 16) {
                        Spacer()
                        documentContent
                        .padding(.horizontal, 20)
                    }
                }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .newInvoice:
                    NewInvoiceView()
                case .newEstimate:
                    NewEstimateView()
                }
            }
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

            Button {
                push(selectedTab == 0 ? .newInvoice : .newEstimate)
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

    private func push(_ route: Route) {
        // Очищаем и добавляем маршрут заново, чтобы SwiftUI корректно
        // обновил стек навигации и обработал transition.
        path.removeAll(keepingCapacity: true)
        path.append(route)
    }

    @ViewBuilder
    private var documentContent: some View {
        switch selectedTab {
        case 0:
            EmptyDocumentView(
                docIcon: "doc",
                docTitleMain: "No invoices yet",
                docTitleSecondary: "Create your first invoice to get started",
                docButtonText: "Create First Invoice",
                onCreate: { push(.newInvoice) }
            )
        default:
            EmptyDocumentView(
                docIcon: "doc.text",
                docTitleMain: "No estimates yet",
                docTitleSecondary: "Create your first estimate to get started",
                docButtonText: "Create First Estimate",
                onCreate: { push(.newEstimate) }
            )
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


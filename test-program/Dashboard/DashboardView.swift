import SwiftUI

struct DashboardView: View {
    @State private var presentedSheet: PresentedSheet?

    private enum PresentedSheet: Identifiable {
        case newInvoice
        case estimate

        var id: String {
            switch self {
            case .newInvoice: "newInvoice"
            case .estimate: "estimate"
            }
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            // Header
            headerSection
            
            ScrollView {
                VStack(spacing: 24) {
                    // Stats Cards
                    statsCardsSection
                    
                    // Action Cards
                    actionCardsSection
                    
                    // Recent Documents
                    recentDocumentsSection
                    
                    EmptyDocumentView(
                        docIcon: "doc",
                        docTitleMain: "No documents yet",
                        docTitleSecondary: "Create your first invoice to get started",
                        docButtonText: "Create First Invoice",
                        onCreate: { presentedSheet = .newInvoice }
                    )
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 40)
            }
        }
        .sheet(item: $presentedSheet) { sheet in
            switch sheet {
            case .newInvoice:
                NewInvoiceView()
            case .estimate:
                NewEstimateView()
            }
        }
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
                presentedSheet = .newInvoice
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
    
    private var statsCardsSection: some View {
        HStack(spacing: 12) {
            StatCard(
                icon: "dollarsign.circle.fill",
                iconColor: .blue,
                title: "Outstanding",
                value: "$0.00"
            )
            
            StatCard(
                icon: "clock.fill",
                iconColor: Color(red: 0.2, green: 0.7, blue: 0.2),
                title: "Paid (month)",
                value: "$0.00"
            )
            
            StatCard(
                icon: "exclamationmark.triangle.fill",
                iconColor: .red,
                title: "Overdue",
                value: "0"
            )
        }
    }
    
    private var actionCardsSection: some View {
        HStack(spacing: 12) {
            ActionCard(
                icon: "doc.text.fill",
                title: "New Invoice",
                onTap: { presentedSheet = .newInvoice }
            )
            
            ActionCard(
                icon: "doc.badge.plus.fill",
                title: "New Estimate",
                onTap: { presentedSheet = .estimate }
            )
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
}

#Preview {
    DashboardView()
}

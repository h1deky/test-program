import SwiftUI

struct DashboardView: View {
    private let features = [
        "Unlimited invoices & estimates",
        "PDF export & email sharing",
        "Multiple payment tracking",
        "Client management",
        "Custom branding"
    ]
    
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
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 40)
            }
        }
        .background(Color.white.ignoresSafeArea())
    }

    private var headerSection: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 2) {
                Text("Dashboard")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.black)
                
            }
            
            Spacer()
            
            Button {
                // Add action
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
                title: "New Invoice"
            )
            
            ActionCard(
                icon: "doc.badge.plus.fill",
                title: "New Estimate"
            )
        }
    }

    private var recentDocumentsSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Recent Documents")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.black)
            
            // Empty State
            VStack(spacing: 16) {
                emptyStateIcon
                
                VStack(spacing: 8) {
                    Text("No documents yet")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.black)
                    
                    Text("Create your first invoice to get started")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                
                Button {
                    // Create first invoice
                } label: {
                    Text("Create First Invoice")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(Color.black)
                        .cornerRadius(8)
                }
                .padding(.top, 8)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 40)
        }
    }

    private var emptyStateIcon: some View {
        ZStack {
            Circle()
                .fill(Color.gray.opacity(0.13))
                .frame(width: 68, height: 68)
            
            Image(systemName: "doc.text")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(Color.black.opacity(0.5))
        }
        .frame(maxWidth: .infinity)
    }
}

struct StatCard: View {
    let icon: String
    let iconColor: Color
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundColor(iconColor)
            
            Text(title)
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.gray)
            
            Text(value)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, minHeight: 95)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color(.systemGray5), lineWidth: 1)
        )
    }
}

struct ActionCard: View {
    let icon: String
    let title: String
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 28))
                .foregroundColor(.black)
            
            Text(title)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, minHeight: 88)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(.systemGray5), lineWidth: 1)
        )
    }
}

#Preview {
    DashboardView()
}

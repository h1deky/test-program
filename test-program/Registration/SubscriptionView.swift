import SwiftUI

struct SubscriptionPlan {
    let id: String
    let name: String
    let price: String
    let period: String
    let badge: String?
    let isSelected: Bool
}

struct SubscriptionView: View {
    @State private var selectedPlan: String = "yearly"
    @Environment(\.dismiss) var dismiss
    
    private let plans: [SubscriptionPlan] = [
        .init(id: "weekly", name: "Weekly", price: "$4.99", period: "/week", badge: nil, isSelected: false),
        .init(id: "yearly", name: "Yearly", price: "$29.99", period: "/year", badge: "Best Value", isSelected: false)
    ]
    
    private let features = [
        "Unlimited invoices & estimates",
        "PDF export & email sharing",
        "Multiple payment tracking",
        "Client management",
        "Custom branding"
    ]
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ScrollView {
                    VStack(spacing: 24) {
                        headerIcon
                        headerTitle
                        plansSection
                        featuresSection
                        actionButtons
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }

    private var headerIcon: some View {
        VStack {
            Image(systemName: "crown.fill")
                .font(.system(size: 40))
                .foregroundColor(.orange)
        }
        .frame(width: 80, height: 80)
        .background(Color(UIColor.systemYellow).opacity(0.2))
        .cornerRadius(40)
        .padding(.top, 8)
    }
    
    private var headerTitle: some View {
        VStack(spacing: 8) {
            Text("Unlock Full Access")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.black)
            
            Text("Free plan: 1 active document or 2 PDF/month")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 24)
    }
    
    private var plansSection: some View {
        VStack(spacing: 12) {
            ForEach(plans, id: \.id) { plan in
                PlanCard(
                    name: plan.name,
                    price: plan.price,
                    period: plan.period,
                    badge: plan.badge,
                    isSelected: selectedPlan == plan.id,
                    onTap: {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            selectedPlan = plan.id
                        }
                    }
                )
            }
        }
        .padding(.horizontal, 24)
    }
    
    private var featuresSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(features, id: \.self) { feature in
                featureRow(feature)
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
    }
    
    private func featureRow(_ feature: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
                .font(.system(size: 18))
            
            Text(feature)
                .font(.system(size: 15, weight: .regular))
                .foregroundColor(.black)
            
            Spacer()
        }
    }
    
    private var actionButtons: some View {
        VStack(spacing: 24) {
            Button {
                // Action
            } label: {
                Text("Start Free Trial")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(Color.blackMain)
                    .cornerRadius(12)
            }
            .buttonStyle(ScaleButtonStyle())
            
            HStack(spacing: 16) {
                Button {
                    // Action
                } label: {
                    Text("Restore Purchase")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                }
                .buttonStyle(LinkButtonStyle())
                
                Divider()
                    .frame(height: 16)
                
                NavigationLink(destination: PrivacyPolicyView()) {
                    Text("Privacy Policy")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                }
                .buttonStyle(LinkButtonStyle())
            }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 24)
        .padding(.top, 24)
    }
}

struct PlanCard: View {
    let name: String
    let price: String
    let period: String
    let badge: String?
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 0) {
                HStack(spacing: 12) {
                    radioButton
                    
                    planInfo
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(
                    isSelected ? Color.black : Color.gray.opacity(0.2),
                    lineWidth: isSelected ? 2 : 1
                )
        )
        .scaleEffect(isSelected ? 1.02 : 1.0)
        .shadow(
            color: isSelected ? Color.black.opacity(0.1) : Color.clear,
            radius: isSelected ? 8 : 0,
            x: 0,
            y: isSelected ? 4 : 0
        )
    }
    
    private var radioButton: some View {
        Circle()
            .stroke(isSelected ? Color.black : Color.gray.opacity(0.3), lineWidth: 2)
            .frame(width: 20, height: 20)
            .overlay(
                Circle()
                    .fill(Color.black)
                    .frame(width: 10, height: 10)
                    .opacity(isSelected ? 1 : 0)
            )
    }
    
    private var planInfo: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack(spacing: 8) {
                Text(name)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.black)
                
                if let badge = badge {
                    Text(badge)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.orange)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.orange.opacity(0.1))
                        .cornerRadius(4)
                }
                
                Spacer()
            }
            
            Text("\(price)\(period)")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.gray)
        }
    }
}

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

struct LinkButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.6 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

struct SectionTitle: View {
    let title: String
    
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(title)
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.black)
            .padding(.top, 8)
    }
}

struct SectionText: View {
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: 14, weight: .regular))
            .foregroundColor(.gray)
            .lineSpacing(2)
    }
}



#Preview {
    NavigationView {
        SubscriptionView()
    }
}

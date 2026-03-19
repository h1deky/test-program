import SwiftUI

struct SubscriptionView: View {
    let onContinue: () -> Void

    @StateObject private var viewModel = SubscriptionViewModel()

    var body: some View {
        ZStack {
            contentSection
        }
        .navigationBarHidden(true)
    }

    private var contentSection: some View {
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

    private var headerIcon: some View {
        VStack {
            Image(systemName: "crown.fill")
                .font(.system(size: 40))
                .foregroundColor(Color.orangeLogo)
        }
        .frame(width: 80, height: 80)
        .background(Color.yellowLogo.opacity(0.2))
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
            ForEach(viewModel.plans) { plan in
                PlanCard(
                    name: plan.name,
                    price: plan.price,
                    period: plan.period,
                    badge: plan.badge,
                    isSelected: viewModel.isSelected(plan),
                    onTap: {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            viewModel.select(plan)
                        }
                    }
                )
            }
        }
        .padding(.horizontal, 24)
    }

    private var featuresSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(viewModel.features, id: \.self) { feature in
                featureRow(feature)
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
    }

    private var actionButtons: some View {
        VStack(spacing: 24) {
            Button {
                onContinue()
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
                    onContinue()
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
}

#Preview {
    NavigationView {
        SubscriptionView(onContinue: {})
    }
}

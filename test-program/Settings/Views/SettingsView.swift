import SwiftUI

private struct SettingsItem: Identifiable {
    let id: String
    let icon: String
    let title: String
    let subtitle: String?
    let message: String
}

private struct SettingsSectionModel: Identifiable {
    let id: String
    let title: String
    let items: [SettingsItem]
}

struct SettingsView: View {
    @State private var selectedItem: SettingsItem?

    private let sections: [SettingsSectionModel] = [
        SettingsSectionModel(
            id: "business",
            title: "Business",
            items: [
                SettingsItem(id: "business_profile", icon: "building.2", title: "Business Profile", subtitle: "sad", message: "Business profile editor will be added here."),
                SettingsItem(id: "invoice_numbering", icon: "number", title: "Invoice Numbering", subtitle: "INV-1002", message: "Invoice numbering settings will be added here."),
                SettingsItem(id: "default_currency", icon: "dollarsign", title: "Default Currency", subtitle: "USD", message: "Default currency settings will be added here."),
                SettingsItem(id: "default_tax", icon: "percent", title: "Default Tax", subtitle: "Configure tax rates", message: "Default tax configuration will be added here."),
                SettingsItem(id: "catalog", icon: "shippingbox", title: "Catalog", subtitle: "0 items", message: "Catalog management will be added here.")
            ]
        ),
        SettingsSectionModel(
            id: "data",
            title: "Data",
            items: [
                SettingsItem(id: "export_data", icon: "square.and.arrow.down", title: "Export Data (JSON)", subtitle: "Download all invoices and clients", message: "Data export will be added here.")
            ]
        ),
        SettingsSectionModel(
            id: "subscription",
            title: "Subscription",
            items: [
                SettingsItem(id: "manage_subscription", icon: "crown", title: "Manage Subscription", subtitle: "Free plan", message: "Subscription management will be added here."),
                SettingsItem(id: "restore_purchases", icon: "arrow.counterclockwise", title: "Restore Purchases", subtitle: nil, message: "Purchase restore will be added here.")
            ]
        ),
        SettingsSectionModel(
            id: "support",
            title: "Support",
            items: [
                SettingsItem(id: "help_support", icon: "questionmark.circle", title: "Help & Support", subtitle: nil, message: "Help center will be added here."),
                SettingsItem(id: "privacy_policy", icon: "shield", title: "Privacy Policy", subtitle: nil, message: "Privacy policy screen will be added here."),
                SettingsItem(id: "terms_of_service", icon: "document", title: "Terms of Service", subtitle: nil, message: "Terms of service screen will be added here.")
            ]
        )
    ]

    var body: some View {
        VStack(spacing: 0) {
            headerSection
            ScrollView {
                VStack(alignment: .leading, spacing: 28) {
                    ForEach(sections) { section in
                        sectionView(section)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 36)
            }
        }
        .background(Color.whiteBackground)
        .sheet(item: $selectedItem) { item in
            ComingSoonView(title: item.title, message: item.message)
        }
    }

    private var headerSection: some View {
        HStack(alignment: .top) {
            Text("Settings")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.black)

            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 16)
        .padding(.bottom, 24)
    }

    private func sectionView(_ section: SettingsSectionModel) -> some View {
        VStack(alignment: .leading, spacing: 18) {
            Text(section.title.uppercased())
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.gray)

            VStack(spacing: 18) {
                ForEach(section.items) { item in
                    settingsRow(item)
                }
            }
        }
    }

    private func settingsRow(_ item: SettingsItem) -> some View {
        Button {
            selectedItem = item
        } label: {
            HStack(spacing: 14) {
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color.surfaceSecondary)
                        .frame(width: 44, height: 44)

                    Image(systemName: item.icon)
                        .font(.system(size: 19, weight: .medium))
                        .foregroundColor(.gray)
                }

                VStack(alignment: .leading, spacing: 3) {
                    Text(item.title)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.black)

                    if let subtitle = item.subtitle {
                        Text(subtitle)
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.gray)
                    }
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.gray)
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    SettingsView()
}

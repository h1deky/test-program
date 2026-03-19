import SwiftUI

struct RegistrationView: View {
    let onComplete: () -> Void

    @StateObject private var viewModel = RegistrationViewModel()

    var body: some View {
        setupFormScreen
    }

    private var setupFormScreen: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                titleSection
                businessNameField
                ownerNameField
                emailField
                phoneField
                addressField
                paymentDetailsRow
                saveButton
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 24)
        }
    }

    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Business Setup")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.black)

            Text("Add your business details for professional invoices")
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.gray)
        }
        .padding(.bottom, 8)
    }

    private var businessNameField: some View {
        FormTextFieldSection(
            title: "Business Name",
            placeholder: "Acme Inc.",
            text: binding(\.businessName),
            isRequired: true
        )
    }

    private var ownerNameField: some View {
        FormTextFieldSection(
            title: "Owner Name",
            placeholder: "John Smith",
            text: binding(\.ownerName)
        )
    }

    private var emailField: some View {
        FormTextFieldSection(
            title: "Email",
            placeholder: "john@acme.com",
            text: binding(\.email),
            isRequired: true,
            keyboardType: .emailAddress,
            capitalization: .never
        )
    }

    private var phoneField: some View {
        FormTextFieldSection(
            title: "Phone",
            placeholder: "+1 (555) 123-4567",
            text: binding(\.phone),
            keyboardType: .phonePad
        )
    }

    private var addressField: some View {
        FormTextFieldSection(
            title: "Address",
            placeholder: "123 Main St, City, State",
            text: binding(\.address)
        )
    }

    private var paymentDetailsRow: some View {
        HStack(spacing: 16) {
            FormTextFieldSection(
                title: "Currency",
                placeholder: "USD",
                text: binding(\.currency)
            )

            FormTextFieldSection(
                title: "Payment Terms",
                placeholder: "Net 30",
                text: binding(\.paymentTerms)
            )
        }
    }

    private var saveButton: some View {
        Button {
            handleSave()
        } label: {
            Text("Save & Continue")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(Color.blackMain)
                .cornerRadius(12)
        }
        .padding(.top, 16)
        .disabled(!viewModel.canContinue)
        .opacity(viewModel.canContinue ? 1.0 : 0.5)
    }

    private func binding(_ keyPath: WritableKeyPath<BusinessSetupForm, String>) -> Binding<String> {
        Binding(
            get: { viewModel.form[keyPath: keyPath] },
            set: { viewModel.form[keyPath: keyPath] = $0 }
        )
    }

    private func handleSave() {
        viewModel.completeSetup()
        onComplete()
    }
}

#Preview {
    RegistrationView(onComplete: {})
}

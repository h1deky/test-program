import SwiftUI

struct NewClientView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = NewClientViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 22) {
                    headerSection
                    nameField
                    emailField
                    phoneField
                    addressField
                    createButton
                    Spacer(minLength: 0)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
            }
            .background(Color.whiteBackground)
            .navigationBarHidden(true)
        }
    }

    private var headerSection: some View {
        HStack(spacing: 14) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "arrow.left")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.black)
            }
            .buttonStyle(.plain)

            Text("New Client")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.black)

            Spacer()
        }
        .padding(.bottom, 6)
    }

    private var nameField: some View {
        FormTextFieldSection(
            title: "Name / Company",
            placeholder: "Client name",
            text: $viewModel.name,
            isRequired: true
        )
    }

    private var emailField: some View {
        FormTextFieldSection(
            title: "Email",
            placeholder: "",
            text: $viewModel.email,
            keyboardType: .emailAddress,
            capitalization: .never
        )
    }

    private var phoneField: some View {
        FormTextFieldSection(
            title: "Phone",
            placeholder: "",
            text: $viewModel.phone,
            keyboardType: .phonePad
        )
    }

    private var addressField: some View {
        FormTextFieldSection(
            title: "Address",
            placeholder: "",
            text: $viewModel.address
        )
    }

    private var createButton: some View {
        Button {
            dismiss()
        } label: {
            Text("Create Client")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 52)
                .background(Color.blackMain)
                .cornerRadius(12)
        }
        .disabled(!viewModel.canCreate)
        .opacity(viewModel.canCreate ? 1.0 : 0.5)
        .padding(.top, 2)
    }
}

#Preview {
    NewClientView()
}

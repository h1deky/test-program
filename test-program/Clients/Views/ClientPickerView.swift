import SwiftUI

struct ClientPickerView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var clientsStore: ClientsStore

    let onSelect: (Client) -> Void

    @State private var isPresentingNewClient = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    createClientButton

                    if clientsStore.clients.isEmpty {
                        emptyState
                    } else {
                        clientsList
                    }
                }
                .padding(20)
            }
            .navigationTitle("Select Client")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $isPresentingNewClient) {
                NewClientView { client in
                    onSelect(client)
                    dismiss()
                }
                .environmentObject(clientsStore)
            }
        }
    }

    private var createClientButton: some View {
        Button {
            isPresentingNewClient = true
        } label: {
            HStack(spacing: 12) {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 20))
                    .foregroundColor(.black)

                Text("Create New Client")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.black)

                Spacer()
            }
            .padding(16)
            .background(Color.surfaceSecondary)
            .cornerRadius(14)
        }
        .buttonStyle(.plain)
    }

    private var emptyState: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("No clients yet")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.black)

            Text("Create your first client and use it in this invoice.")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Color.surfaceSecondary)
        .cornerRadius(14)
    }

    private var clientsList: some View {
        VStack(spacing: 12) {
            ForEach(clientsStore.clients) { client in
                Button {
                    onSelect(client)
                    dismiss()
                } label: {
                    HStack(spacing: 12) {
                        ZStack {
                            Circle()
                                .fill(Color.surfaceSecondary)
                                .frame(width: 42, height: 42)

                            Image(systemName: "person.fill")
                                .foregroundColor(.black)
                        }

                        VStack(alignment: .leading, spacing: 4) {
                            Text(client.name)
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.black)

                            if !client.email.isEmpty {
                                Text(client.email)
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundColor(.gray)
                            } else if !client.phone.isEmpty {
                                Text(client.phone)
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundColor(.gray)
                            }
                        }

                        Spacer()

                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding(16)
                    .background(Color.surfaceSecondary)
                    .cornerRadius(14)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

#Preview {
    ClientPickerView(onSelect: { _ in })
        .environmentObject(ClientsStore())
}

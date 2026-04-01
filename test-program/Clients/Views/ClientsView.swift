import SwiftUI

struct ClientsView: View {
    @EnvironmentObject private var clientsStore: ClientsStore

    @State private var isPresentingNewClient = false
    @State private var searchText = ""

    var body: some View {
        VStack(spacing: 0) {
            headerSection
            searchField(searchText: $searchText)
                .padding(.horizontal, 16)
            ScrollView {
                VStack(spacing: 12) {
                    if filteredClients.isEmpty {
                        emptyState
                    } else {
                        ForEach(filteredClients) { client in
                            clientRow(client)
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .padding(.bottom, 24)
            }
        }
        .sheet(isPresented: $isPresentingNewClient) {
            NewClientView()
        }
    }

    private var headerSection: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 2) {
                Text("Clients")
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundColor(.black)
            }
            Spacer()
            Button {
                isPresentingNewClient = true
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

    private func searchField(searchText: Binding<String>) -> some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 8)

            TextField("Search clients...", text: searchText)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.gray)
                .padding(12)
        }
        .background(Color.surfaceTertiary)
        .cornerRadius(12)
    }

    private var filteredClients: [Client] {
        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !query.isEmpty else {
            return clientsStore.clients
        }

        return clientsStore.clients.filter { client in
            client.name.localizedCaseInsensitiveContains(query)
            || client.email.localizedCaseInsensitiveContains(query)
            || client.phone.localizedCaseInsensitiveContains(query)
        }
    }

    private var emptyState: some View {
        VStack(spacing: 12) {
            Image(systemName: "person.2")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.gray)

            Text("No clients yet")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.black)

            Text("Create a client and use it in invoices.")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 48)
        .background(Color.surfaceSecondary)
        .cornerRadius(16)
    }

    private func clientRow(_ client: Client) -> some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.surfaceSecondary)
                    .frame(width: 48, height: 48)

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
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(14)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.borderLight, lineWidth: 1)
        )
        .cornerRadius(16)
    }
}

#Preview {
    ClientsView()
        .environmentObject(ClientsStore())
}

import SwiftUI

struct ClientsView: View {
    @State private var isPresentingNewClient = false

    var body: some View {
        VStack(spacing: 0) {
            headerSection
            searchField(searchText: .constant(""))
                .padding(.horizontal, 16)
            ScrollView {
                Spacer(minLength: 0)
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
}

#Preview {
    ClientsView()
}

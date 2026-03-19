import SwiftUI

struct NewEstimateView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = NewEstimateViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                formSection
            }
            .navigationTitle("New Estimate")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: toolbarContent)
            .sheet(item: $viewModel.presentedSheet, content: sheetView)
        }
    }

    private var formSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            estimateNumberSection
            datesSection
            clientSection
            itemsSection
            taxDiscountSection
            notesSection
            totalSection
        }
        .padding()
    }

    private var estimateNumberSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Estimate Number")
                .font(.subheadline)
            TextField("", text: $viewModel.estimateNumber)
                .formFieldStyle()
        }
    }

    private var datesSection: some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Issue Date")
                    .font(.subheadline)
                TextField("", text: $viewModel.issueDate)
                    .formFieldStyle()
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Due Date")
                    .font(.subheadline)
                TextField("", text: $viewModel.dueDate)
                    .formFieldStyle()
            }
        }
    }

    private var clientSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Client")
                .font(.subheadline)
            HStack {
                Image(systemName: "person.2")
                    .foregroundColor(.gray)
                TextField("Select client", text: $viewModel.clientName)
            }
            .formFieldStyle()
        }
    }

    private var itemsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            itemsHeader
            itemCard
            addItemButton
        }
    }

    private var itemsHeader: some View {
        HStack {
            Text("Items")
                .font(.headline)
            Spacer()
            Button(action: viewModel.openCatalog) {
                HStack(spacing: 4) {
                    Image(systemName: "cube.box")
                    Text("Catalog")
                }
                .font(.subheadline)
                .foregroundColor(.primary)
            }
        }
    }

    private var itemCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Item 1")
                .font(.caption)
                .foregroundColor(.gray)

            TextField("Item name", text: $viewModel.itemName)
                .font(.body)

            itemDetailsRow

            HStack {
                Toggle(isOn: $viewModel.isTaxable) {
                    Text("Taxable")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .toggleStyle(SwitchToggleStyle(tint: .black))

                Spacer()

                Text("$0.00")
                    .font(.subheadline)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }

    private var itemDetailsRow: some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Qty")
                    .font(.caption)
                    .foregroundColor(.gray)
                TextField("1", text: $viewModel.qty)
                    .keyboardType(.decimalPad)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text("Rate")
                    .font(.caption)
                    .foregroundColor(.gray)
                TextField("0", text: $viewModel.rate)
                    .keyboardType(.decimalPad)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text("Unit")
                    .font(.caption)
                    .foregroundColor(.gray)
                TextField("", text: $viewModel.unit)
                    .padding(8)
                    .background(Color.white)
                    .cornerRadius(6)
            }
        }
    }

    private var addItemButton: some View {
        Button(action: viewModel.openAddItem) {
            HStack {
                Image(systemName: "plus")
                Text("Add Item")
            }
            .frame(maxWidth: .infinity)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.systemGray4), lineWidth: 1)
            )
        }
        .foregroundColor(.primary)
    }

    private var taxDiscountSection: some View {
        Button(action: viewModel.openTaxDiscount) {
            HStack {
                Image(systemName: "percent")
                Text("Tax & Discount")
                Spacer()
                Text("None")
                    .foregroundColor(.gray)
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.systemGray4), lineWidth: 1)
            )
        }
        .foregroundColor(.primary)
    }

    private var notesSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Notes")
                .font(.subheadline)
            TextField("Thank you for your business!", text: $viewModel.notes, axis: .vertical)
                .lineLimit(3...6)
                .formFieldStyle()
        }
    }

    private var totalSection: some View {
        VStack(spacing: 12) {
            HStack {
                Text("Subtotal")
                Spacer()
                Text("$0.00")
            }
            HStack {
                Text("Total")
                Spacer()
                Text("$0.00")
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }

    @ToolbarContentBuilder
    private func toolbarContent() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button(action: dismiss.callAsFunction) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.primary)
            }
        }
    }

    private func sheetView(for sheet: EstimateSheet) -> some View {
        ComingSoonView(title: sheet.title, message: sheet.message)
    }
}

#Preview {
    NewEstimateView()
}

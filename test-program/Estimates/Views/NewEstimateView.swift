import SwiftUI

struct NewEstimateView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = NewEstimateViewModel()

    var body: some View {
        NavigationStack {
            contentSection
            .navigationTitle("New Estimate")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: toolbarContent)
            .sheet(item: $viewModel.presentedSheet, content: sheetView)
        }
    }

    private var contentSection: some View {
        VStack(spacing: 0) {
            DocumentComposerTabBar(selection: $viewModel.selectedTab)
            activeTabContent
        }
    }

    @ViewBuilder
    private var activeTabContent: some View {
        switch viewModel.selectedTab {
        case .draft:
            ScrollView {
                formSection
            }
        case .preview:
            ScrollView {
                previewSection
                    .padding()
            }
        case .send:
            ScrollView {
                sendSection
                    .padding()
            }
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
            Button {
                viewModel.openCatalog()
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: "cube.box")
                    Text("Catalog")
                }
                .font(.subheadline)
                .foregroundColor(.black)
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
        .background(Color.surfaceSecondary)
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
        Button {
            viewModel.openAddItem()
        } label: {
            HStack {
                Image(systemName: "plus")
                Text("Add Item")
            }
            .frame(maxWidth: .infinity)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.borderLight, lineWidth: 1)
            )
        }
        .foregroundColor(.black)
    }

    private var taxDiscountSection: some View {
        Button {
            viewModel.openTaxDiscount()
        } label: {
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
                    .stroke(Color.borderLight, lineWidth: 1)
            )
        }
        .foregroundColor(.black)
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
        .background(Color.surfaceSecondary)
        .cornerRadius(12)
    }

    private var previewSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            previewHeader(title: "Estimate Preview", number: viewModel.estimateNumber)
            previewCard(title: "Client", value: viewModel.clientName, fallback: "No client selected")
            previewCard(title: "Issue Date", value: viewModel.issueDate, fallback: "Not set")
            previewCard(title: "Due Date", value: viewModel.dueDate, fallback: "Not set")
            previewCard(title: "Item", value: viewModel.itemName, fallback: "No items added")
            previewCard(title: "Notes", value: viewModel.notes, fallback: "No notes yet")
        }
    }

    private var sendSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            previewHeader(title: "Send Estimate", number: viewModel.estimateNumber)

            Text("Choose how you want to send this document.")
                .font(.system(size: 15, weight: .regular))
                .foregroundColor(.gray)

            actionTile(title: "Send by Email", subtitle: "Prepare estimate for email delivery")
            actionTile(title: "Export PDF", subtitle: "Generate a PDF version for sharing")
        }
    }

    private func previewHeader(title: String, number: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.black)

            Text(number.isEmpty ? "No document number" : number)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.gray)
        }
    }

    private func previewCard(title: String, value: String, fallback: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.gray)

            Text(value.isEmpty ? fallback : value)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Color.surfaceSecondary)
        .cornerRadius(14)
    }

    private func actionTile(title: String, subtitle: String) -> some View {
        Button {
            // Sending actions are not implemented yet.
        } label: {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(title)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black)

                    Text(subtitle)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                }

                Spacer()

                Image(systemName: "arrow.right")
                    .foregroundColor(.black)
            }
            .padding(16)
            .background(Color.surfaceSecondary)
            .cornerRadius(14)
        }
    }

    @ToolbarContentBuilder
    private func toolbarContent() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "arrow.left")
                    .foregroundColor(.black)
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

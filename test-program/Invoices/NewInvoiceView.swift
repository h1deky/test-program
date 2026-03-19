import SwiftUI

struct NewInvoiceView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var invoiceNumber: String = "INV-1001"
    @State private var issueDate: String = ""
    @State private var dueDate: String = ""
    @State private var clientName: String = ""

    @State private var itemName: String = ""
    @State private var qty: String = "1"
    @State private var rate: String = "0"
    @State private var unit: String = ""
    @State private var isTaxable: Bool = true

    @State private var notes: String = ""
    @State private var paymentDetails: String = ""

    @State private var isCatalogPresented: Bool = false
    @State private var isTaxDiscountPresented: Bool = false
    @State private var isAddItemPresented: Bool = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Invoice Number")
                            .font(.subheadline)
                        TextField("", text: $invoiceNumber)
                            .customFieldStyle()
                    }

                    HStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Issue Date")
                                .font(.subheadline)
                            TextField("", text: $issueDate)
                                .customFieldStyle()
                        }

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Due Date")
                                .font(.subheadline)
                            TextField("", text: $dueDate)
                                .customFieldStyle()
                        }
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Client")
                            .font(.subheadline)
                        HStack {
                            Image(systemName: "person.2")
                                .foregroundColor(.gray)
                            TextField("Select client", text: $clientName)
                        }
                        .customFieldStyle()
                    }

                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("Items")
                                .font(.headline)
                            Spacer()
                            Button {
                                isCatalogPresented = true
                            } label: {
                                HStack(spacing: 4) {
                                    Image(systemName: "cube.box")
                                    Text("Catalog")
                                }
                                .font(.subheadline)
                                .foregroundColor(.primary)
                            }
                        }

                        VStack(alignment: .leading, spacing: 16) {
                            Text("Item 1")
                                .font(.caption)
                                .foregroundColor(.gray)

                            TextField("Item name", text: $itemName)
                                .font(.body)

                            HStack(spacing: 16) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Qty").font(.caption).foregroundColor(.gray)
                                    TextField("1", text: $qty)
                                        .keyboardType(.decimalPad)
                                }

                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Rate").font(.caption).foregroundColor(.gray)
                                    TextField("0", text: $rate)
                                        .keyboardType(.decimalPad)
                                }

                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Unit").font(.caption).foregroundColor(.gray)
                                    TextField("", text: $unit)
                                        .padding(8)
                                        .background(Color.white)
                                        .cornerRadius(6)
                                }
                            }

                            HStack {
                                Toggle(isOn: $isTaxable) {
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

                        // Add Item Button (stub)
                        Button {
                            isAddItemPresented = true
                        } label: {
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

                    Button {
                        isTaxDiscountPresented = true
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
                                .stroke(Color(.systemGray4), lineWidth: 1)
                        )
                    }
                    .foregroundColor(.primary)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Notes")
                            .font(.subheadline)
                        TextField("Thank you for your business!", text: $notes, axis: .vertical)
                            .lineLimit(3...6)
                            .customFieldStyle()
                    }

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
                .padding()
            }
            .navigationTitle("New Invoice")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.primary)
                    }
                }
            }
            .sheet(isPresented: $isCatalogPresented) {
                ComingSoonView(title: "Catalog", message: "Каталог товаров/услуг пока заглушка.")
            }
            .sheet(isPresented: $isTaxDiscountPresented) {
                ComingSoonView(title: "Tax & Discount", message: "Настройка налогов/скидок пока заглушка.")
            }
            .sheet(isPresented: $isAddItemPresented) {
                ComingSoonView(title: "Add Item", message: "Добавление позиции пока заглушка.")
            }
        }
    }
}

private struct CustomFieldStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
    }
}

private extension View {
    func customFieldStyle() -> some View {
        modifier(CustomFieldStyleModifier())
    }
}

// Preview
#Preview {
    NewInvoiceView()
}


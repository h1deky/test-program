import SwiftUI

struct NewInvoiceView: View {

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
                            Button(action: {}) {
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
                        
                        // Add Item Button
                        Button(action: {}) {
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

                    Button(action: {}) {
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

                    HStack(spacing: 12) {
                        ActionButton(icon: "doc", title: "Draft", isPrimary: false)
                        ActionButton(icon: "eye", title: "Preview", isPrimary: false)
                        ActionButton(icon: "paperplane", title: "Send", isPrimary: true)
                    }

                    TextField("Bank: ... / Zelle: ...", text: $paymentDetails, axis: .vertical)
                        .lineLimit(2...4)
                        .customFieldStyle()

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
                    Button(action: {
                        // Dismiss action
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}

struct CustomFieldStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
    }
}

extension View {
    func customFieldStyle() -> some View {
        self.modifier(CustomFieldStyleModifier())
    }
}

struct ActionButton: View {
    let icon: String
    let title: String
    let isPrimary: Bool
    
    var body: some View {
        Button(action: {}) {
            HStack(spacing: 6) {
                Image(systemName: icon)
                Text(title)
            }
            .font(.subheadline.weight(.medium))
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(isPrimary ? Color.black : Color.clear)
            .foregroundColor(isPrimary ? .white : .primary)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isPrimary ? Color.clear : Color(.systemGray4), lineWidth: 1)
            )
        }
    }
}

// Preview
#Preview {
    NewInvoiceView()
}

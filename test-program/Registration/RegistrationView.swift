import SwiftUI

struct RegistrationView: View {
    @State private var isBusinessSetupComplete: Bool = false
    
    @State private var businessName = ""
    @State private var ownerName = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var address = ""
    @State private var currency = ""
    @State private var paymentTerms = ""
    
    var body: some View {
        if isBusinessSetupComplete {
            RootTabView()
        } else {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Заголовок
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Business Setup")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.black)
                        
                        Text("Add your business details for professional invoices")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom, 8)
                    
                    // Business Name
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Business Name")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.black)
                            Text("*")
                                .foregroundColor(.red)
                        }
                        
                        TextField("Acme Inc.", text: $businessName)
                            .font(.system(size: 16, weight: .regular))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(8)
                    }
                    
                    // Owner Name
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Owner Name")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.black)
                        
                        TextField("John Smith", text: $ownerName)
                            .font(.system(size: 16, weight: .regular))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(8)
                    }
                    
                    // Email
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Email")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.black)
                            Text("*")
                                .foregroundColor(.red)
                        }
                        
                        TextField("john@acme.com", text: $email)
                            .font(.system(size: 16, weight: .regular))
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(8)
                    }
                    
                    // Phone
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Phone")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.black)
                        
                        TextField("+1 (555) 123-4567", text: $phone)
                            .font(.system(size: 16, weight: .regular))
                            .keyboardType(.phonePad)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(8)
                    }
                    
                    // Address
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Address")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.black)
                        
                        TextField("123 Main St, City, State", text: $address)
                            .font(.system(size: 16, weight: .regular))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(8)
                    }
                    
                    // Currency и Payment Terms в два столбца
                    HStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Currency")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.black)
                            
                            TextField("USD", text: $currency)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.horizontal, 16)
                                .padding(.vertical, 12)
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(8)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Payment Terms")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.black)
                            
                            TextField("Net 30", text: $paymentTerms)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.horizontal, 16)
                                .padding(.vertical, 12)
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(8)
                        }
                    }
                    
                    Spacer()
                        .frame(height: 16)
                    
                    // Save & Continue Button
                    Button {
                        isBusinessSetupComplete = true
                    } label: {
                        Text("Save & Continue")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(Color.blackMain)
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 24)
            }
        }
    }
}

#Preview {
    RegistrationView()
}

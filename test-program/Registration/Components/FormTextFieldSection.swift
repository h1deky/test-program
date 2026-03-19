import SwiftUI

struct FormTextFieldSection: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    var isRequired = false
    var keyboardType: UIKeyboardType = .default
    var capitalization: TextInputAutocapitalization = .sentences

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 4) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.black)

                if isRequired {
                    Text("*")
                        .foregroundColor(.red)
                }
            }

            TextField(placeholder, text: $text)
                .font(.system(size: 16, weight: .regular))
                .keyboardType(keyboardType)
                .textInputAutocapitalization(capitalization)
                .formFieldStyle()
        }
    }
}

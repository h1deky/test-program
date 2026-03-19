import SwiftUI

struct FormFieldStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
    }
}

extension View {
    func formFieldStyle() -> some View {
        modifier(FormFieldStyleModifier())
    }
}

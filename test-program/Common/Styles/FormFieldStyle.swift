import SwiftUI

struct FormFieldStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.surfaceSecondary)
            .cornerRadius(10)
    }
}

extension View {
    func formFieldStyle() -> some View {
        modifier(FormFieldStyleModifier())
    }
}

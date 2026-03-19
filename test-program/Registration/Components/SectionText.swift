import SwiftUI

struct SectionText: View {
    let text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .font(.system(size: 14, weight: .regular))
            .foregroundColor(.gray)
            .lineSpacing(2)
    }
}


import SwiftUI

struct ComingSoonView: View {
    let title: String
    let message: String

    init(title: String = "Coming soon", message: String = "This feature is stubbed for now.") {
        self.title = title
        self.message = message
    }

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "hourglass")
                .font(.system(size: 40))
                .foregroundColor(.gray)

            Text(title)
                .font(.system(size: 22, weight: .semibold))

            Text(message)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)

            Spacer()
        }
        .padding(.top, 48)
    }
}

#Preview {
    ComingSoonView()
}


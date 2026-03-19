import SwiftUI

struct EmptyDocumentView: View {
    let docIcon: String
    let docTitleMain: String
    let docTitleSecondary: String
    let docButtonText: String
    var onCreate: () -> Void = {}

    init(
        docIcon: String,
        docTitleMain: String,
        docTitleSecondary: String,
        docButtonText: String,
        onCreate: @escaping () -> Void = {}
    ) {
        self.docIcon = docIcon
        self.docTitleMain = docTitleMain
        self.docTitleSecondary = docTitleSecondary
        self.docButtonText = docButtonText
        self.onCreate = onCreate
    }

    var body: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color.gray.opacity(0.13))
                    .frame(width: 68, height: 68)

                Image(systemName: docIcon)
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundColor(Color.black.opacity(0.5))
            }
            .frame(maxWidth: .infinity)

            VStack(spacing: 8) {
                Text(docTitleMain)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.black)

                Text(docTitleSecondary)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }

            Button {
                onCreate()
            } label: {
                Text(docButtonText)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(Color.black)
                    .cornerRadius(8)
            }
            .padding(.top, 8)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 40)
    }
}

#Preview {
    EmptyDocumentView(
        docIcon: "doc",
        docTitleMain: "No documents yet",
        docTitleSecondary: "Create your first invoice to get started",
        docButtonText: "Create First Invoice"
    )
}

import SwiftUI

struct ActionCard: View {
    let icon: String
    let title: String
    var onTap: () -> Void = {}

    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.system(size: 28))
                    .foregroundColor(.black)

                Text(title)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity, minHeight: 88)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(.systemGray5), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
}


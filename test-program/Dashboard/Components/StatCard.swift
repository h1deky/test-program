import SwiftUI

struct StatCard: View {
    let icon: String
    let iconColor: Color
    let title: String
    let value: String

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundColor(iconColor)

            Text(title)
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.gray)

            Text(value)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, minHeight: 95)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color(.systemGray5), lineWidth: 1)
        )
    }
}


import SwiftUI

struct PlanCard: View {
    let name: String
    let price: String
    let period: String
    let badge: String?
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 12) {
                radioButton
                planInfo
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(
                    isSelected ? Color.black : Color.gray.opacity(0.2),
                    lineWidth: isSelected ? 2 : 1
                )
        )
        .scaleEffect(isSelected ? 1.02 : 1.0)
        .shadow(
            color: isSelected ? Color.black.opacity(0.1) : Color.clear,
            radius: isSelected ? 8 : 0,
            x: 0,
            y: isSelected ? 4 : 0
        )
    }

    private var radioButton: some View {
        Circle()
            .stroke(isSelected ? Color.black : Color.gray.opacity(0.3), lineWidth: 2)
            .frame(width: 20, height: 20)
            .overlay(
                Circle()
                    .fill(Color.black)
                    .frame(width: 10, height: 10)
                    .opacity(isSelected ? 1 : 0)
            )
    }

    private var planInfo: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack(spacing: 8) {
                Text(name)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.black)

                if let badge {
                    Text(badge)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.orange)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.orange.opacity(0.1))
                        .cornerRadius(4)
                }

                Spacer()
            }

            Text("\(price)\(period)")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.gray)
        }
    }
}

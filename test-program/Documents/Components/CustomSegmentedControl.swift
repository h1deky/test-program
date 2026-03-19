import SwiftUI

struct CustomSegmentedControl: View {
    @Binding var selection: Int
    let items: [String]

    @Namespace private var animation

    init(selection: Binding<Int>, items: [String] = ["Invoices", "Estimates"]) {
        self._selection = selection
        self.items = items
    }

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<items.count, id: \.self) { index in
                Button {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                        selection = index
                    }
                } label: {
                    Text(items[index])
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(selection == index ? .black : .gray)
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .background(
                            ZStack {
                                if selection == index {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.white)
                                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                                        .matchedGeometryEffect(id: "TAB", in: animation)
                                }
                            }
                        )
                }
            }
        }
        .padding(4)
        .background(Color.surfaceSecondary)
        .cornerRadius(16)
        .padding()
    }
}

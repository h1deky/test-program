import SwiftUI

struct CustomPageIndicator: View {
    let numberOfPages: Int
    @Binding var currentPage: Int

    var activeColor: Color = .black
    var inactiveColor: Color = Color(UIColor.systemGray5)
    var activeWidth: CGFloat = 30
    var dotSize: CGFloat = 10
    var spacing: CGFloat = 8

    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Capsule()
                    .fill(currentPage == index ? activeColor : inactiveColor)
                    .frame(width: currentPage == index ? activeWidth : dotSize, height: dotSize)
                    .animation(.spring(response: 0.4, dampingFraction: 0.7, blendDuration: 0.5), value: currentPage)
                    .onTapGesture {
                        withAnimation {
                            currentPage = index
                        }
                    }
            }
        }
    }
}

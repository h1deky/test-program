import SwiftUI

struct OnboardingPageView: View {
    let page: OnboardingPage

    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            iconSection
            titleSection
            descriptionSection
            Spacer()
        }
    }

    private var iconSection: some View {
        ZStack {
            Circle()
                .fill(Color.circleGray)
                .frame(width: 120, height: 120)

            Image(systemName: page.iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.black)
        }
        .padding(.bottom, 24)
    }

    private var titleSection: some View {
        Text(page.title)
            .font(.system(size: 28, weight: .semibold))
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
    }

    private var descriptionSection: some View {
        Text(page.description)
            .font(.system(size: 16, weight: .regular))
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
            .lineSpacing(4)
            .padding(.horizontal, 32)
    }
}

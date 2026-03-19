import SwiftUI

struct OnboardingView: View {
    let onFinish: () -> Void

    @StateObject private var viewModel = OnboardingViewModel()

    var body: some View {
        VStack(spacing: 0) {
            skipButtonRow
            pagesSection
            indicatorSection
            actionButtonSection
        }
    }

    private var skipButtonRow: some View {
        HStack {
            Spacer()
            Button("Skip", action: onFinish)
                .foregroundColor(.gray)
                .padding(.trailing, 24)
                .padding(.top, 16)
        }
    }

    private var pagesSection: some View {
        TabView(selection: $viewModel.currentPage) {
            ForEach(Array(viewModel.pages.enumerated()), id: \.offset) { index, page in
                OnboardingPageView(page: page)
                    .tag(index)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }

    private var indicatorSection: some View {
        CustomPageIndicator(
            numberOfPages: viewModel.pages.count,
            currentPage: $viewModel.currentPage,
            activeColor: .black,
            inactiveColor: Color(UIColor.systemGray5)
        )
        .padding(.vertical, 32)
    }

    private var actionButtonSection: some View {
        Button(action: handlePrimaryAction) {
            Text(viewModel.primaryButtonTitle)
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(Color.blackMain)
                .cornerRadius(12)
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 32)
    }

    private func handlePrimaryAction() {
        if viewModel.isLastPage {
            onFinish()
            return
        }

        withAnimation(.easeInOut(duration: 0.5)) {
            viewModel.moveForward()
        }
    }
}

#Preview {
    ContentView()
}

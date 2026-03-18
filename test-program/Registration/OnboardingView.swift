import SwiftUI

enum OnboardingPage: String, CaseIterable, Identifiable {
    case createInvoices = "doc.text"
    case sendPDF = "paperplane"
    case getPaid = "chart.xyaxis.line"
    
    var id: String { self.rawValue }
    
    var iconName: String {
        self.rawValue
    }
    
    var title: String {
        switch self {
        case .createInvoices:
            return "Create invoices in 30 sec"
        case .sendPDF:
            return "Send PDF instantly"
        case .getPaid:
            return "Track paid/overdue"
        }
    }
    
    var description: String {
        switch self {
        case .createInvoices:
            return "Quickly generate professional\ninvoices with your business details,\nline items, and taxes."
        case .sendPDF:
            return "Share polished PDF invoices via email or\nany app directly from your phone."
        case .getPaid:
            return "Stay on top of your cash flow. See\n what's paid, outstanding, and overdue at a glance."
        }
    }
}

struct OnboardingView: View {
    @Binding var navigationPath: [ContentView.Screen]
    @State private var currentPage = 0
    
    let pages: [OnboardingPage] = OnboardingPage.allCases
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Skip") {
                    finishOnboarding()
                }
                .foregroundColor(.gray)
                .padding(.trailing, 24)
                .padding(.top, 16)
            }
            

            TabView(selection: $currentPage) {
                ForEach(0..<pages.count, id: \.self) { index in
                    OnboardingPageView(page: pages[index])
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            
            CustomPageIndicator(
                numberOfPages: pages.count,
                currentPage: $currentPage,
                activeColor: .black,
                inactiveColor: Color(UIColor.systemGray5)
            )
            .padding(.vertical, 32)
            
            Button {
                if currentPage < pages.count - 1 {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        currentPage += 1
                    }
                } else {
                    finishOnboarding()
                }
            } label: {
                Text(currentPage == pages.count - 1 ? "Get Started" : "Continue")
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
    }
    
    private func finishOnboarding() {
        navigationPath.append(.businessSetup)
    }
}

// Верстка отдельной страницы
struct OnboardingPageView: View {
    let page: OnboardingPage
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
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
            
            // Заголовок
            Text(page.title)
                .font(.system(size: 28, weight: .semibold))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
            
            // Описание
            Text(page.description)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .padding(.horizontal, 32)
            
            Spacer()
        }
    }
}


#Preview {
    ContentView()
}

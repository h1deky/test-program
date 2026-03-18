import SwiftUI


struct CustomPageIndicator: View {
    let numberOfPages: Int
    @Binding var currentPage: Int
    
    // Настройки внешнего вида
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
                    // Если страница активна, делаем капсулу широкой, иначе — делаем её размером с точку
                    .frame(width: currentPage == index ? activeWidth : dotSize,
                           height: dotSize)
                    // Плавная анимация изменения размера и цвета
                    .animation(.spring(response: 0.4, dampingFraction: 0.7, blendDuration: 0.5), value: currentPage)
                    .onTapGesture {
                        // Опционально: переключение по клику на точку
                        withAnimation {
                            currentPage = index
                        }
                    }
            }
        }
    }
}


struct PrivacyPolicyView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Privacy Policy")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black)
                    
                    Text("Last Updated: March 18, 2026")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        SectionTitle("1. Introduction")
                        SectionText("We respect your privacy and are committed to protecting your personal data. This privacy policy explains how we collect, use, and protect your information when you use our application.")
                        
                        SectionTitle("2. Data We Collect")
                        SectionText("We collect information you provide directly, such as your business name, email address, and phone number. We also collect usage data to improve our services.")
                        
                        SectionTitle("3. How We Use Your Data")
                        SectionText("Your data is used to provide and improve our services, send you updates, and comply with legal obligations. We do not sell your personal information to third parties.")
                        
                        SectionTitle("4. Data Security")
                        SectionText("We implement industry-standard security measures to protect your data from unauthorized access, alteration, and destruction.")
                        
                        SectionTitle("5. Your Rights")
                        SectionText("You have the right to access, correct, or delete your personal information at any time by contacting us.")
                        
                        SectionTitle("6. Contact Us")
                        SectionText("If you have any questions about this privacy policy, please contact us at privacy@invoicemaker.com")
                    }
                    .padding(.vertical, 8)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 24)
            }
            
            Spacer()
        }
    }
}


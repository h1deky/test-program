import SwiftUI

enum DocumentComposerTab: String, CaseIterable, Identifiable {
    case draft = "Draft"
    case preview = "Preview"
    case send = "Send"

    var id: String {
        rawValue
    }
}

struct DocumentComposerTabBar: View {
    @Binding var selection: DocumentComposerTab

    var body: some View {
        HStack(spacing: 8) {
            ForEach(DocumentComposerTab.allCases) { tab in
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selection = tab
                    }
                } label: {
                    Text(tab.rawValue)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(selection == tab ? .white : .black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 42)
                        .background(selection == tab ? Color.blackMain : Color.surfaceSecondary)
                        .cornerRadius(10)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal)
        .padding(.top, 12)
    }
}

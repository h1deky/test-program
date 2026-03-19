import SwiftUI

enum MainTab: String, CaseIterable, Hashable, Identifiable {
    case home
    case documents
    case clients
    case settings

    var id: String {
        rawValue
    }

    var title: String {
        switch self {
        case .home:
            return "Home"
        case .documents:
            return "Documents"
        case .clients:
            return "Clients"
        case .settings:
            return "Settings"
        }
    }

    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .documents:
            return "doc.text"
        case .clients:
            return "person.2"
        case .settings:
            return "gearshape"
        }
    }
}

struct CustomTabBarView: View {
    @Binding var selectedTab: MainTab

    var body: some View {
        VStack(spacing: 0) {
            Divider()
            HStack(spacing: 0) {
                ForEach(MainTab.allCases) { tab in
                    tabBarItem(tab)
                }
            }
            .frame(height: 64)
            .background(Color.white)
        }
        .ignoresSafeArea(edges: .bottom)
    }

    private func tabBarItem(_ tab: MainTab) -> some View {
        Button {
            withAnimation(.easeInOut(duration: 0.2)) {
                selectedTab = tab
            }
        } label: {
            VStack(spacing: 4) {
                Image(systemName: tab.iconName)
                    .font(.system(size: 22, weight: .regular))

                Text(tab.title)
                    .font(.system(size: 11, weight: .regular))
            }
            .foregroundColor(selectedTab == tab ? .black : .gray)
            .frame(maxWidth: .infinity)
        }
    }
}

struct RootTabView: View {
    @StateObject private var viewModel = RootTabViewModel()

    var body: some View {
        VStack(spacing: 0) {
            tabContent
                .ignoresSafeArea(edges: .bottom)
            CustomTabBarView(selectedTab: $viewModel.selectedTab)
        }
    }

    @ViewBuilder
    private var tabContent: some View {
        switch viewModel.selectedTab {
        case .home:
            DashboardView()
        case .documents:
            DocumentView()
        case .clients:
            ClientsView()
        case .settings:
            SettingsView()
        }
    }
}



#Preview {
    RootTabView()
}

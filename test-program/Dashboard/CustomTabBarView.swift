import SwiftUI

enum MainTab: String, CaseIterable, Hashable {
    case home
    case documents
    case clients
    case settings
    
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
                ForEach(MainTab.allCases, id: \.self) { tab in
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
    @State private var selectedTab: MainTab = .home
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                // Tab Content
                tabContent
                    .ignoresSafeArea(edges: .bottom)
                
                // Custom Tab Bar
                CustomTabBarView(selectedTab: $selectedTab)
            }
        }
    }
    
    @ViewBuilder
    private var tabContent: some View {
        switch selectedTab {
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


struct ClientsView: View {
    var body: some View {
        VStack {
            Text("Clients")
                .font(.system(size: 28, weight: .bold))
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 16)
    }
}

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Settings")
                .font(.system(size: 28, weight: .bold))
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 16)
    }
}

#Preview {
    RootTabView()
}

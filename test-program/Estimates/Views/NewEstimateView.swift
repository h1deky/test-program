import SwiftUI

struct NewEstimateView: View {
    @StateObject private var viewModel: DocumentComposerViewModel

    init() {
        _viewModel = StateObject(wrappedValue: DocumentComposerViewModel(kind: .estimate))
    }

    var body: some View {
        DocumentComposerView(viewModel: viewModel)
    }
}

#Preview {
    NewEstimateView()
        .environmentObject(ClientsStore())
}

import SwiftUI

struct NewInvoiceView: View {
    @StateObject private var viewModel: DocumentComposerViewModel

    init() {
        _viewModel = StateObject(wrappedValue: DocumentComposerViewModel(kind: .invoice))
    }

    var body: some View {
        DocumentComposerView(viewModel: viewModel)
    }
}

#Preview {
    NewInvoiceView()
        .environmentObject(ClientsStore())
}

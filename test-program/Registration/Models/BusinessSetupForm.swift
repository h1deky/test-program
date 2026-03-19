import Foundation

struct BusinessSetupForm {
    var businessName = ""
    var ownerName = ""
    var email = ""
    var phone = ""
    var address = ""
    var currency = ""
    var paymentTerms = ""

    var canContinue: Bool {
        !businessName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

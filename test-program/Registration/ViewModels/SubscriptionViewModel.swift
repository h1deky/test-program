import Foundation
import Combine

final class SubscriptionViewModel: ObservableObject {
    @Published var selectedPlanID = "yearly"

    let plans: [SubscriptionPlan] = [
        SubscriptionPlan(id: "weekly", name: "Weekly", price: "$4.99", period: "/week", badge: nil),
        SubscriptionPlan(id: "yearly", name: "Yearly", price: "$29.99", period: "/year", badge: "Best Value")
    ]

    let features: [String] = [
        "Unlimited invoices & estimates",
        "PDF export & email sharing",
        "Multiple payment tracking",
        "Client management",
        "Custom branding"
    ]

    func isSelected(_ plan: SubscriptionPlan) -> Bool {
        selectedPlanID == plan.id
    }

    func select(_ plan: SubscriptionPlan) {
        selectedPlanID = plan.id
    }
}

import Foundation

enum SubscriptionSheet: String, Identifiable {
    case trial
    case restore

    var id: String {
        rawValue
    }

    var title: String {
        switch self {
        case .trial:
            return "Start Free Trial"
        case .restore:
            return "Restore Purchase"
        }
    }

    var message: String {
        switch self {
        case .trial:
            return "Пока заглушка: подключение подписки будет позже."
        case .restore:
            return "Пока заглушка: восстановление покупок будет позже."
        }
    }
}

struct SubscriptionPlan: Identifiable {
    let id: String
    let name: String
    let price: String
    let period: String
    let badge: String?
}

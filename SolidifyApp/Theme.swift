import SwiftUI

struct Theme {

    enum ColorScheme {
        case primary
        case secondary
        case background
        case text

        var color: Color {
            switch self {
            case .primary:
                return Color("PrimaryColor")
            case .secondary:
                return Color("SecondaryColor")
            case .background:
                return Color("BackgroundColor")
            case .text:
                return Color("TextColor")
            }
        }
    }
}


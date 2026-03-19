//
//  Colors.swift
//  test-program-1
//
//  Created by Олександр Капашин on 17.03.2026.
//

import SwiftUI

extension Color {
    
    static func fromHex(_ hex: String) -> Color {
        var cleanedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanedHex = cleanedHex.replacingOccurrences(of: "#", with: "")
        
        if cleanedHex.count == 6 {
            let scanner = Scanner(string: cleanedHex)
            var rgbValue: UInt64 = 0
            scanner.scanHexInt64(&rgbValue)
            
            let red = Double((rgbValue >> 16) & 0xFF) / 255.0
            let green = Double((rgbValue >> 8) & 0xFF) / 255.0
            let blue = Double(rgbValue & 0xFF) / 255.0
            
            return Color(red: red, green: green, blue: blue)
        }
        return .white
    }


    static let blackMain: Color = fromHex("#0A0A0A")
    static let circleGray: Color = fromHex("#eeeeee")
    static let yellowLogo: Color = fromHex("#FFEA00")
    static let orangeLogo: Color = fromHex("#FF9500")

    
}



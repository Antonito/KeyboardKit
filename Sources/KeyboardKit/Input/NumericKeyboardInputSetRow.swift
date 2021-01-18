//
//  NumericKeyboardInputSetRow.swift
//  KeyboardKit
//
//  Created by Antoine Baché on 18/01/2021.
//

import Foundation

// MARK: - Implementations

public final class NumericKeyboardInputSetRow: KeyboardInputSetRow {
    convenience init(symbol: String) {
        self.init(lowercase: symbol, uppercase: symbol)
    }

    /// Returns the lowercase version of the callout, for the provided locale.
    public override func lowercasedCallouts(for locale: Locale) -> [String] {
        self.getCallouts(for: locale).map(String.init)
    }

    /// Returns the uppercase version of the callout, for the provided locale.
    public override func uppercasedCallouts(for locale: Locale) -> [String] {
        self.getCallouts(for: locale).map(String.init)
    }

    private func getCallouts(for locale: Locale) -> String {
        switch self.lowercase {
        case "-": return "-–—•"
        case "/": return "/\\"
        case "&": return "&§"
        case "”": return "\"”“„»«"
        case ".": return ".…"
        case "?": return "?¿"
        case "!": return "!¡"
        case "'", "’": return "'’‘`"

        default: return ""
        }
    }
}

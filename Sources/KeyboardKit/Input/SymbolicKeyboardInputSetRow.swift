//
//  SymbolicKeyboardInputSetRow.swift
//  KeyboardKit
//
//  Created by Antoine Baché on 18/01/2021.
//

import Foundation

public final class SymbolicKeyboardInputSetRow: KeyboardInputSetRow {
    convenience init(symbol: String) {
        self.init(lowercase: symbol, uppercase: symbol)
    }

    /// Returns the lowercase version of the callout, for the provided locale.
    public override func lowercasedCallouts(for locale: Locale) -> [String] {
        Self.getCallouts(for: locale, self.lowercase).map(String.init)
    }

    /// Returns the uppercase version of the callout, for the provided locale.
    public override func uppercasedCallouts(for locale: Locale) -> [String] {
        Self.getCallouts(for: locale, self.lowercase).map(String.init)
    }

    static private func getCallouts(for locale: Locale, _ symbol: String) -> String {
        switch symbol {
        case "%": return "%‰"
        case "=": return "=≠≈"

        default: return ""
        }
    }
}

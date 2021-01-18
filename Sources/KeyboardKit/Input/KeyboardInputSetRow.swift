//
//  KeyboardInputSetRow.swift
//  KeyboardKit
//
//  Created by Antoine Baché on 17/01/2021.
//

import Foundation

public class KeyboardInputSetRow: Equatable {
    public let lowercase: String
    public let uppercase: String

    public init(
        lowercase: String,
        uppercase: String
    ) {
        self.lowercase = lowercase
        self.uppercase = uppercase
    }

    public static func == (
        lhs: KeyboardInputSetRow,
        rhs: KeyboardInputSetRow
    ) -> Bool {
        lhs.lowercase == rhs.lowercase
          && lhs.uppercase == rhs.uppercase
    }

    /// Returns the lowercase version of the callout, for the provided locale.
    func lowercasedCallouts(for locale: Locale) -> [String] { [] }

    /// Returns the uppercase version of the callout, for the provided locale.
    func uppercasedCallouts(for locale: Locale) -> [String] { [] }
}

// MARK: - Sequence

public extension Sequence where Element == KeyboardInputSetRow {
    var symbols: [String] {
        self.map { $0.lowercase }
    }

    func lowercased() -> [String] {
        self.map { $0.lowercase }
    }

    func uppercased() -> [String] {
        self.map { $0.uppercase }
    }
}

public extension Sequence where Iterator.Element == [KeyboardInputSetRow] {
    var symbols: [[String]] {
        self.map { $0.symbols }
    }

    func uppercased() -> [[String]] {
        self.map { $0.uppercased() }
    }

    func lowercased() -> [[String]] {
        self.map { $0.lowercased() }
    }
}

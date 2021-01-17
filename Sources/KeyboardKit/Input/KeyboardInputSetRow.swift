//
//  KeyboardInputSetRow.swift
//  KeyboardKit
//
//  Created by Antoine Baché on 17/01/2021.
//

import Foundation

public class KeyboardInputSetRow: Equatable {
    public let lowercased: String
    public let uppercased: String

    public init(lowercased: String, uppercased: String) {
        self.lowercased = lowercased
        self.uppercased = uppercased
    }

    public static func == (
        lhs: KeyboardInputSetRow,
        rhs: KeyboardInputSetRow
    ) -> Bool {
        lhs.lowercased == rhs.lowercased
          && lhs.uppercased == rhs.uppercased
    }
}

extension Sequence where Element == KeyboardInputSetRow {
    public var elements: [String] {
        self.map { $0.lowercased }
    }

    public func lowercased() -> [String] {
        self.map { $0.lowercased }
    }

    public func uppercased() -> [String] {
        self.map { $0.uppercased }
    }
}

extension Sequence where Iterator.Element == [KeyboardInputSetRow] {
    var elements: [[String]] {
        self.map { $0.elements }
    }

    func uppercased() -> [[String]] {
        self.map { $0.uppercased() }
    }

    func lowercased() -> [[String]] {
        self.map { $0.lowercased() }
    }
}

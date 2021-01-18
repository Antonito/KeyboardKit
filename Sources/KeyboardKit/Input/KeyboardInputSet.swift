//
//  KeyboardInputSet.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-07-03.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 A "keyboard input set" represents the text input parts of a
 system keyboard, i.e. the lighter input keys.
 
 Some devices may add additional inputs to an input set. For
 instance, iPad devices adds punctionation and characters to
 the bottom rows. These inputs are not considered to be part
 of the input set, but rater the full keyboard layout.
 
 To implement a system keyboard, you need a `KeyboardLayout`
 instead of just an input set, since a layout also specifies
 the actions that surround the input set characters.
 */
public class KeyboardInputSet: Equatable {
    
    public init(inputRows: [InputRow]) {
        self.inputRows = inputRows
    }
    
    public typealias InputRow = [KeyboardInputSetRow]
    
    public let inputRows: [InputRow]
    
    public static func == (lhs: KeyboardInputSet, rhs: KeyboardInputSet) -> Bool {
        lhs.inputRows == rhs.inputRows
    }
}

/**
 This input set should only be used in alphabetic keyboards.
 */
public class AlphabeticKeyboardInputSet: KeyboardInputSet {
  convenience init(alphabet: [[String]]) {
    let inputRows = alphabet.map { $0.map { KeyboardInputSetRow(lowercase: $0.lowercased(), uppercase: $0.uppercased()) } }
    self.init(inputRows: inputRows)
  }
}

/**
 This input set should only be used in numeric keyboards.
 */
public class NumericKeyboardInputSet: KeyboardInputSet {
  convenience init(symbols: [[String]]) {
    let inputRows = symbols.map { $0.map { NumericKeyboardInputSetRow(symbol: $0) } }
    self.init(inputRows: inputRows)
  }
}

/**
 This input set should only be used in symbolic keyboards.
 */
public class SymbolicKeyboardInputSet: KeyboardInputSet {
  convenience init(symbols: [[String]]) {
    let inputRows = symbols.map { $0.map { SymbolicKeyboardInputSetRow(symbol: $0) } }
    self.init(inputRows: inputRows)
  }
}

//
//  InlineStyleTests.swift
//  DownTests
//
//  Created by John Nguyen on 29.07.19.
//  Copyright © 2016-2019 Down. All rights reserved.
//

#if os(iOS)

@testable import Down

class InlineStyleTests: StylerTestSuite {

    // # Important
    //
    // Snapshot tests must be run on the same simulator used to record the reference snapshots, otherwise
    // the comparison may fail. These tests were recorded on the **iPhone 12** simulator.

    // MARK: - Simple

    func test_StrikethroughText() throws {
        try evaluate("Text ~~strike through~~ text.")
        try evaluate("~~Strike through text.~~")
        try evaluate("~~func bool(forKey aKey: String)~~")
        try evaluate(
"""
~~func bool(forKey aKey: String)~~

## Headline

**bold statement**
""")
    }
    
    func test_inlineCode() throws {
        try evaluate("Text `code` is cool.")
    }
    
    func test_codeBlock() throws {
        try evaluate(
"""
```
func doSomething() {
    print("hi")
}
```
"""
        )
    }
    
    private func evaluate(_ text: String) throws {
        let down = Down(markdownString: text)
        let result = try down.toXML()
        
        print(result)
    }
    
    func testThat_StrongText_IsStyled() {
        // Given
        let markdown = "Text **strong** text."

        // Then
        assertStyle(for: markdown, width: .wide)
    }

    func testThat_StrikethroughText_IsStyled() {
        // Given
        let markdown = "Text ~~strike through~~ text."

        // Then
        assertStyle(for: markdown, width: .wide)
    }
    
    func testThat_EmphasizedText_IsStyled() {
        // Given
        let markdown = "Text _emphasized_ text."

        // Then
        assertStyle(for: markdown, width: .wide)
    }

    func testThat_CodeText_IsStyled() {
        // Given
        let markdown = "Text `code` text <html> text."

        // Then
        assertStyle(for: markdown, width: .wide)
    }

    // MARK: - Double Combinations

    func testThat_StrongEmphasizedText_IsStyled() {
        // Given
        let markdown = "Text **strong _emphasized_ strong** text."

        // Then
        assertStyle(for: markdown, width: .wide)
    }

    func testThat_EmphasizedStrongText_IsStyled() {
        // Given
        let markdown = "Text _emphasized **strong** emphasized_ text."

        // Then
        assertStyle(for: markdown, width: .wide)
    }

    func testThat_StrongCode_IsStyled() {
        // Given
        let markdown = "Text **strong `code` strong <html> strong** text."

        // Then
        assertStyle(for: markdown, width: .wide)
    }

    func testThat_EmphasizedCode_IsStyled() {
        // Given
        let markdown = "Text _emphasized `code` emphasized <html> emphasized_ text."

        // Then
        assertStyle(for: markdown, width: .wide)
    }

    // MARK: - Triple Combinations

    func testThat_StrongEmphasizedCode_IsStyled() {
        // Given
        let markdown = "Text **strong _emphasized `code` emphasized <html> emphasized_ strong** text."

        // Then
        assertStyle(for: markdown, width: .wide)
    }

    func testThat_EmphasizedStrongCode_IsStyled() {
        // Given
        let markdown = "Text _emphasized **strong `code` strong <html> strong** emphasized_ text."

        // Then
        assertStyle(for: markdown, width: .wide)
    }

}

#endif

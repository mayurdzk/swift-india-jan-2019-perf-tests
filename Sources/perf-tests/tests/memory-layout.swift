//
//  memory-layout.swift
//  perf-tests
//
//  Created by Mayur Dhaka on 03/01/19.
//

import Foundation


func testMemoryLayouts() {
    testTwoIntStruct()
    testTwoIntOneBoolStruct()
    testTwoCaseEnum()
    testEightCaseEnum()
    testStringRawValueEnum()
}

private struct TwoIntStruct {
    let firstInt: Int
    let secondInt: Int
}

private func testTwoIntStruct() {
    printMemoryCharacteristics(of: TwoIntStruct.self)
}

private struct TwoIntOneBoolStruct {
    let firstInt: Int
    let secondInt: Int
    let bool: Bool
}

private func testTwoIntOneBoolStruct() {
    printMemoryCharacteristics(of: TwoIntOneBoolStruct.self)
}


private enum TwoCaseEnum {
    case first, second
}

private func testTwoCaseEnum() {
    printMemoryCharacteristics(of: TwoCaseEnum.self)
}

private enum EightCaseEnum {
    case first, second, third, fourth,
        fifth, sixth, seventh, eighth
}

private func testEightCaseEnum() {
    printMemoryCharacteristics(of: EightCaseEnum.self)
}

private enum StringRawValueEnum: String {
    case first = "firstValue"
    case second = "secondValue"
    case third = "thirdValue"
    case fourth = "fourthValue"
}

private func testStringRawValueEnum() {
    printMemoryCharacteristics(of: StringRawValueEnum.self)
}

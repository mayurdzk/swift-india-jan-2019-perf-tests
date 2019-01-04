//
//  preallocation-wins.swift
//  perf-tests
//
//  Created by Mayur Dhaka on 29/12/18.
//

import Foundation

// Pro-Tip: Inverse these two numbers and the 2x speed gains reduce dramatically
// This is because there are fewer buffer re-allocations in the raw
// buffer, which means the pre-allocation win is almost neglected.
let innerLoopCount = 100
let outerLoopCount = 1000000

func testPreAllocationWins() {
    testRawArrayBufferAppend()
    testPreAllocatedArrayBufferAppend()
    testResuedArrayBufferAppend()
}

private func testRawArrayBufferAppend() {
    measurePrint(description: "Appending To Raw Buffer") {
        for _ in 0...outerLoopCount {
            var buffer = Array<Int>.init()
            for i in 0...innerLoopCount {
                buffer.append(i)
            }
        }
    }
}

private func testPreAllocatedArrayBufferAppend() {
    measurePrint(description: "Appending To Pre-Allocated Buffer") {
        for _ in 0...outerLoopCount {
            var buffer = Array<Int>.init()
            buffer.reserveCapacity(innerLoopCount)
            for i in 0...innerLoopCount {
                buffer.append(i)
            }
        }
    }
}

private func testResuedArrayBufferAppend() {
    measurePrint(description: "Appending To Reused Buffer") {
        var buffer = Array<Int>.init()
        buffer.reserveCapacity(innerLoopCount)
        for _ in 0...outerLoopCount {
            for i in 0...innerLoopCount {
                buffer.append(i)
            }
            buffer.removeAll(keepingCapacity: true)
        }
    }
}


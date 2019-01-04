//
//  func-vs-closure-vs-sel.swift
//  perf-tests
//
//  Created by Mayur Dhaka on 29/12/18.
//

import Foundation

func testFunctionVsClosure() {
    setFibClosure()
    let dataset = createDataSet()
    testFibClosure(dataset: dataset)
    testFibFunction(dataset: dataset)
}

private func testFibFunction(dataset: [Int]) {
    measurePrint(description: "FibFunction") {
        var fibResults: Array<Int> = []
        for i in dataset {
            fibResults.append(
                fibFunc(n: i)
            )
        }
    }
}

private func testFibClosure(dataset: [Int]) {
    measurePrint(description: "FibClosure") {
        var fibResults: Array<Int> = []
        for i in dataset {
            fibResults.append(
                fibClosure(i)
            )
        }
    }
}

private func fibFunc(n: Int) -> Int {
    guard n > 1 else { return n }
    return fibFunc(n: n-1) + fibFunc(n: n-2)
}

private var fibClosure: (Int) -> Int = { $0 }

private func setFibClosure() {
    fibClosure = { n -> Int in
        guard n > 1 else { return n }
        return fibClosure(n-1) + fibClosure(n-2)
    }
}

func createDataSet() -> [Int] {
    var dataSet: Array<Int> = []
    for i in 0...40 {
        dataSet.append(i)
    }
    return dataSet
}


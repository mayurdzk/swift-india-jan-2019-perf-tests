//
//  retain-release-costs.swift
//  perf-tests
//
//  Created by Mayur Dhaka on 30/12/18.
//

import Foundation

private let DatasetSize = 42000000

func testRetainReleaseCosts() {
    testStructFunctionCalls()
    testClassFunctionCalls()
}

private func testStructFunctionCalls() {
    let dataSet = createStructCoordinatesDataset()
    var results: [Int] = []
    results.reserveCapacity(DatasetSize)
    
    measurePrint(description: "Struct Calls") {
        for coordinate in dataSet {
            results.append(
                doFooWithStructCoordinate(c: coordinate)
            )
        }
    }
}

private func testClassFunctionCalls() {
    let dataSet = createClassCoordinatesDataset()
    var results: [Int] = []
    results.reserveCapacity(DatasetSize)
    
    measurePrint(description: "Class Calls (Retain/Release)") {
        for coordinate in dataSet {
            results.append(doFooWithClassCoordinate(c: coordinate))
        }
    }
}

private struct SCoordinate {
    let x: Int
    let y: Int
    let z: Int
}

private class CCoordinate {
    let x: Int
    let y: Int
    let z: Int
    
    init(x: Int, y: Int, z: Int) {
        self.x = x
        self.y = y
        self.z = z
    }
}

private func createStructCoordinatesDataset() -> [SCoordinate] {
    var coordinates: [SCoordinate] = []
    for i in 0...DatasetSize {
        coordinates.append(
            SCoordinate(x: i, y: i, z: i)
        )
    }
    
    return coordinates
}

private func createClassCoordinatesDataset() -> [CCoordinate] {
    var coordinates: [CCoordinate] = []
    for i in 0...DatasetSize {
        coordinates.append(
            CCoordinate(x: i, y: i, z: i)
        )
    }
    
    return coordinates
}

private func doFooWithStructCoordinate(c: SCoordinate) -> Int {
    let x = c.x
    return x + doBarWithStructCoordinate(c: c)
}

private func doBarWithStructCoordinate(c: SCoordinate) -> Int {
    let y = c.y
    return y + doFazWithStructCoordinate(c: c)
}

private func doFazWithStructCoordinate(c: SCoordinate) -> Int {
    let z = c.z
    return z
}

private func doFooWithClassCoordinate(c: CCoordinate) -> Int {
    let x = c.x
    return x + doBarWithClassCoordinate(c: c)
}

private func doBarWithClassCoordinate(c: CCoordinate) -> Int {
    let y = c.y
    return y + doFazWithClassCoordinate(c: c)
}

private func doFazWithClassCoordinate(c: CCoordinate) -> Int {
    let z = c.z
    return z
}

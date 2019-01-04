//
//  mem-characteristics.swift
//  perf-tests
//
//  Created by Mayur Dhaka on 30/12/18.
//

import Foundation


func printMemoryCharacteristics<T>(of: T.Type) {
    print("Memory Characteristics Of \(T.self)")
    print("size: \(MemoryLayout<T>.size)")
    print("stride: \(MemoryLayout<T>.stride)")
    print("alignment: \(MemoryLayout<T>.alignment)")
    print()
}

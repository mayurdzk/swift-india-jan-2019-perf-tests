//
//  perf-measure-print.swift
//  perf-tests
//
//  Created by Mayur Dhaka on 29/12/18.
//

import Foundation

func measurePrint(description: String, work: () -> Void) {
    print(description)
    invalidateCache()
    let pre = Date()
    work()
    let post = Date()
    let timeTaken = post.timeIntervalSince(pre)
    print(timeTaken)
    print()
}

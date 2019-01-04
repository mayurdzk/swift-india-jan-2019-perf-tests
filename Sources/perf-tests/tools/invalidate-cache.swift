//
//  invalidate-cache.swift
//  perf-tests
//
//  Created by Mayur Dhaka on 29/12/18.
//

import Foundation


func invalidateCache() {
    // We do some junk operations here, to fill and then drop
    // the contents of a cache buffer.
    //
    // This function is a "we hope it works", not a "we're certain it works
    // attempt.
    //
    // It should be enough to flush any contents of cache between operations.
    let n = 200000
    var doubles = Array<Double>.init()
    
    for _ in 0...n {
        let randomDouble = Double.random(in: 3.141...500.0)
        doubles.append(randomDouble)
    }
    
    doubles = []
    print("Cache cleared...")
}

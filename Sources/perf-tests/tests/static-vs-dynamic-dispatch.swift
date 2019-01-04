//
//  static-vs-dynamic-dispatch.swift
//  perf-tests
//
//  Created by Mayur Dhaka on 30/12/18.
//

import Foundation

private let DatasetSize = 900000

func testStaticVsDynamicDispatch() {
//    testStaticDispatch()
//    testDynamicDispatch()
    testDispatch()
}

func testDispatch() {
    let p = ParticleModel()
    measurePrint(description: "Dispatch") {
        for _ in 0...DatasetSize {
            for i in stride(from: 0.0, through: 720, by: 1.0) {
                p.update(newP: i * sin(i), newV:i*1000)
            }
        }
    }
}

class ParticleModel {
    var point = 0.0
    var velocity = 100.0
    
    @objc dynamic func updatePoint(newPoint: Double, newVelocity: Double) {
        point = newPoint
        velocity = newVelocity
    }
    
    @objc dynamic func update(newP: Double, newV: Double) {
        updatePoint(newPoint: newP, newVelocity: newV)
    }
}

class Other: ParticleModel {
    override func updatePoint(newPoint: Double, newVelocity: Double) {
        point = newPoint * 2
        velocity = newVelocity * 2
    }
    override func update(newP: Double, newV: Double) {
    }
}


//private func testStaticDispatch() {
//    let dataset = createFinalClassDataset()
//    var results: [Int] = []
//    results.reserveCapacity(DatasetSize)
//
//    measurePrint(description: "Static Dispatch") {
//        for o in dataset {
//            results.append(executeFooOnFinalClass(o: o))
//        }
//    }
//}

//private func testDynamicDispatch() {
//    let dataset = createBaseClassDataset()
//    var results: [Int] = []
//    results.reserveCapacity(DatasetSize)
//
//    measurePrint(description: "Dynamic Dispatch") {
//        for o in dataset {
//            results.append(executeFooOnBaseClass(o: o))
//        }
//    }
//}
//
//
//private func executeFooOnBaseClass(o: BaseClass) -> Int {
//    return 2 + o.foo() + o.foo() + o.foo() + o.foo()
//}
//
////private func _executeFooOnBaseClass(o: BaseClass) -> Int {
////    return 1 + __executeFooOnBaseClass(o: o) + o.foo()
////}
////
////private func __executeFooOnBaseClass(o: BaseClass) -> Int {
////    return o.foo()
////}
////
////private func executeFooOnFinalClass<T>(o: T) -> Int where T: Fooer {
////    return 2 + _executeFooOnFinalClass(o: o) + o.foo()
////}
////
////private func _executeFooOnFinalClass<T>(o: T) -> Int where T: Fooer {
////    return 1 + __executeFooOnFinalClass(o: o) + o.foo()
////}
////
////private func __executeFooOnFinalClass<T>(o: T) -> Int where T: Fooer {
////    return o.foo()
////}
//
//
//private class BaseClass {
//    private let number: Int
//
//    init(number: Int) {
//        self.number = number
//    }
//
//    func foo() -> Int {
//        return number + 1
//    }
//}
//
////private class InheritedClass: BaseClass {
////    private let number: Int
////
////    override init(number: Int) {
////        self.number = number * 2
////        super.init(number: number)
////    }
////
////    override func foo() -> Int {
////        return number + 2
////    }
////}
////
////private class InheritedClass2: InheritedClass {
////    private let number: Int
////
////    override init(number: Int) {
////        self.number = number * 2
////        super.init(number: number)
////    }
////
////    override func foo() -> Int {
////        return number + 2
////    }
////}
////
////private final class FinalClass: InheritedClass2, Fooer {
////    private let number: Int
////
////    override init(number: Int) {
////        self.number = number * 3
////        super.init(number: number)
////    }
////
////    final override func foo() -> Int {
////        return number + 3
////    }
////}
//
//private func createBaseClassDataset() -> [BaseClass] {
//    var dataset: [BaseClass] = []
//
//    for i in 0...DatasetSize {
////        if i % 3 == 0 {
//            dataset.append(BaseClass(number: i))
////        } else if i % 2 == 0 {
////            dataset.append(InheritedClass(number: i))
////        } else {
////            dataset.append(BaseClass(number: i))
////        }
//    }
//
//    return dataset
//}
//
////private func createFinalClassDataset() -> [FinalClass] {
////    var dataset: [FinalClass] = []
////
////    for i in 0...DatasetSize {
////        dataset.append(FinalClass(number: i))
////    }
////
////    return dataset
////}
//
//protocol Fooer {
//    func foo() -> Int
//}

//: Playground - noun: a place where people can play

import UIKit

print("dog")

typealias Dog = Int

let myThing: Dog = 5

typealias SomeFunc = Int -> (String, Float)

struct FibsGenerator: GeneratorType {
    var last2: (Int, Int)
    let maxVal = Int(4e6)
    
    typealias Element = Int
    
//    init(){ }
//    
//    init(first2: (Int, Int)) {
//        self.last2 = first2
//    }
    
    init(first2: (Int, Int) = (1, 2)) {
        self.last2 = first2
    }
    
    mutating func next() -> FibsGenerator.Element? {
        let nextVal = last2.0 + last2.1
        let oldVal = last2.0
        
        if oldVal < maxVal {
            last2 = (last2.1, nextVal)
            return oldVal
        } else {
            return nil
        }
    }
}

struct FibsSequence: SequenceType {
    internal func generate() -> FibsGenerator {
        return FibsGenerator(first2: (2, 3))
    }
}

func myFunc(someInt: Int, someStr: String) {
    print(someInt)
    print(someStr)
}

//print("hi")

let seq = FibsSequence()

let even = seq.filter{ $0 % 2 == 0 }

even.reduce(0, combine: +)


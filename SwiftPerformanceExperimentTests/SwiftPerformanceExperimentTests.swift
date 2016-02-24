import XCTest
import SwiftPerformanceExperiment

class SwiftPerformanceExperimentTests: XCTestCase {
    func testFooPerformance() {
        let foo = Foo<Int>(values: (1...1000000).map { $0 })
        measureBlock {
            _ = foo.map { $0 << 1 }
        }
    }
    
    func testBarPerformance() {
        let bar = Bar(values: (1...1000000).map { $0 })
        measureBlock {
            _ = bar.map { $0 << 1 }
        }
    }
    
    func testBazPerformance() {
        let baz = Baz<Int>(values: (1...1000000).map { $0 })
        measureBlock {
            _ = baz.map { $0 << 1 }
        }
    }
    
    func testQuxPerformance() {
        let qux = Qux<Int>(values: (1...1000000).map { $0 })
        measureBlock {
            _ = qux.map { $0 << 1 }
        }
    }
    
    func testArrayPerformance() {
        let array: [Int] = (1...1000000).map { $0 }
        measureBlock {
            _ = array.map { $0 << 1 }
        }
    }
}

public struct Baz<T> {
    private var values: [T]
    
    public init(values: [T]) {
        self.values = values
    }
}

extension Baz {
    public func map<U>(@noescape transform: T throws -> U) rethrows -> Baz<U> {
        return Baz<U>(values: try values.map(transform))
    }
}
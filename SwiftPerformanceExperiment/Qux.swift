public struct Qux<T> {
    private var values: [T]
    
    public init(values: [T]) {
        self.values = values
    }
}

extension Qux {
    public func map<U>(transform: T -> U) -> Qux<U> {
        if let zelf = self as? Qux<Int>,
            let f = (transform as? (Int -> Int)),
            let result = (Qux<Int>(values: zelf.values.map(f)) as? Qux<U>) {
            return result
        }
        return Qux<U>(values: values.map(transform))
    }
}
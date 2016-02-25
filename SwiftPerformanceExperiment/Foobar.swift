public struct Foobar<T> {
    private var values: [T]
    
    public init(values: [T]) {
        self.values = values
    }
}

extension Foobar {
    public func map<U>(@noescape transform: T throws -> U) rethrows -> Foobar<U> {
        return Foobar<U>(values: try values.map(transform))
    }
    
    public func map(@noescape transform: T throws -> Int) rethrows -> Foobar<Int> {
        return Foobar<Int>(values: try values.map(transform))
    }
}
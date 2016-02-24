public struct Foo<T> {
    private var values: [T]
    
    public init(values: [T]) {
        self.values = values
    }
}

extension Foo {
    public func map<U>(@noescape transform: T throws -> U) rethrows -> Foo<U> {
        return Foo<U>(values: try values.map(transform))
    }
}
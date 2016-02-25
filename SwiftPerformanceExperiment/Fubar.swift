public struct Fubar<T> {
    private var values: [T]
    
    public init(values: [T]) {
        self.values = values
    }
}

extension Fubar {
    public func map<U>(@noescape transform: T throws -> U) rethrows -> Fubar<U> {
        return Fubar<U>(values: try values.map(transform))
    }
    
    public func map(@noescape transform: Int throws -> Int) rethrows -> Fubar<Int> {
        guard let zelf = self as? Fubar<Int> else {
            fatalError()
        }
        
        return Fubar<Int>(values: try zelf.values.map(transform))
    }
}
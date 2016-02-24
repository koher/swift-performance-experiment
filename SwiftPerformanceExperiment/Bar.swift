public struct Bar {
    private var values: [Int]
    
    public init(values: [Int]) {
        self.values = values
    }
}

extension Bar {
    public func map(@noescape transform: Int throws -> Int) rethrows -> Bar {
        return Bar(values: try values.map(transform))
    }
}
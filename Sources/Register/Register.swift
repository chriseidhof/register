public struct Token: Hashable, Equatable {
    private let i: Int
    init(_ i: Int) { self.i = i }
}

public struct Register<A> {
    private var items: [Token:A] = [:]
    private let freshNumber: () -> Token
    public init() {
        var iterator = (Int.min...).makeIterator()
        freshNumber = { Token(iterator.next()!) }
    }

    @discardableResult
    public mutating func add(_ value: A) -> Token {
        let token = freshNumber()
        items[token] = value
        return token
    }

    public mutating func remove(_ token: Token) {
        items[token] = nil
    }

    public subscript(token: Token) -> A? {
        return items[token]
    }

    public var values: AnySequence<A> {
        return AnySequence(items.values)
    }

    public mutating func removeAll() {
        items = [:]
    }

    public var keys: AnySequence<Token> {
        return AnySequence(items.keys)
    }
}

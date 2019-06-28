public struct Token: Hashable, Equatable {
    private let i: Int
    init(_ i: Int) { self.i = i }
}

public struct Register<A>: Collection {
    public typealias Items = [Token:A]
    private var items: Items = [:]
    private let freshNumber: () -> Token
    public init() {
        var iterator = (Int.min...).makeIterator()
        freshNumber = { Token(iterator.next()!) }
    }
    
    public var startIndex: Items.Index {
        return items.startIndex
    }
    public var endIndex: Items.Index {
        return items.endIndex
    }
    public func index(after i: Dictionary<Token, A>.Index) -> Dictionary<Token, A>.Index {
        return items.index(after: i)
    }
    
    public subscript(index: Items.Index) -> Items.Element {
        return items[index]
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

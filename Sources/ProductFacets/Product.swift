
@dynamicMemberLookup
public struct Product<Facet>: Identifiable {

    public let id: String
    public let name: String
    private var facet: Facet
    init(id: String, name: String, facet: Facet) {
        self.id = id
        self.name = name
        self.facet = facet
    }

    public subscript<Value>(dynamicMember keyPath: KeyPath<Facet, Value>) -> Value {
        facet[keyPath: keyPath]
    }

    public subscript<Value>(dynamicMember keyPath: WritableKeyPath<Facet, Value>) -> Value {
        get { facet[keyPath: keyPath] }
        set { facet[keyPath: keyPath] = newValue }
    }
}

extension Product: Equatable where Facet: Equatable {}
extension Product: Hashable where Facet: Hashable {}
extension Product: Sendable where Facet: Sendable {}

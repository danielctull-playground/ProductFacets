
@dynamicMemberLookup
public struct Multi<LHS, RHS> {
    var lhs: LHS
    var rhs: RHS

    public subscript<Value>(dynamicMember keyPath: KeyPath<LHS, Value>) -> Value {
        lhs[keyPath: keyPath]
    }

    public subscript<Value>(dynamicMember keyPath: WritableKeyPath<LHS, Value>) -> Value {
        get { lhs[keyPath: keyPath] }
        set { lhs[keyPath: keyPath] = newValue }
    }

    public subscript<Value>(dynamicMember keyPath: KeyPath<RHS, Value>) -> Value {
        rhs[keyPath: keyPath]
    }

    public subscript<Value>(dynamicMember keyPath: WritableKeyPath<RHS, Value>) -> Value {
        get { rhs[keyPath: keyPath] }
        set { rhs[keyPath: keyPath] = newValue }
    }
}

extension Multi: Equatable where LHS: Equatable, RHS: Equatable {}
extension Multi: Hashable where LHS: Hashable, RHS: Hashable {}
extension Multi: Sendable where LHS: Sendable, RHS: Sendable {}

// MARK: - Price and SKU

extension Product where Facet == Multi<SKUFacet, PriceFacet> {

    public init(id: String, name: String, sku: String, price: Price) {
        self.init(id: id, name: name, facet: Multi(lhs: SKUFacet(sku: sku), rhs: PriceFacet(price: price)))
    }
}

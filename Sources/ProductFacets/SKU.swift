
public struct SKUFacet {
    public let sku: String
}

extension Product where Facet == SKUFacet {

    public init(id: String, name: String, sku: String) {
        self.init(id: id, name: name, facet: SKUFacet(sku: sku))
    }
}

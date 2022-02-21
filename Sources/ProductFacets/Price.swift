import Foundation

public struct Price: Equatable {
    public let amount: Decimal
    public let currency: String
}

extension Price {

    public static func eur(_ amount: Decimal) -> Price {
        Price(amount: amount, currency: "EUR")
    }
}

public struct PriceFacet {
    public let price: Price
}

extension Product where Facet == PriceFacet {

    public init(id: String, name: String, price: Price) {
        self.init(id: id, name: name, facet: PriceFacet(price: price))
    }
}

import XCTest
@testable import ProductFacets

final class ProductFacetsTests: XCTestCase {

    func testPriceFacetDynamicMemberLookup() throws {
        let product = Product(id: "1", name: "Rice", price: .eur(1.30))
        XCTAssertEqual(product.id, "1")
        XCTAssertEqual(product.name, "Rice")
        XCTAssertEqual(product.price, .eur(1.3))
    }

    func testSKUFacetDynamicMemberLookup() throws {
        let product = Product(id: "1", name: "Rice", sku: "SKU")
        XCTAssertEqual(product.id, "1")
        XCTAssertEqual(product.name, "Rice")
        XCTAssertEqual(product.sku, "SKU")
    }

    func testMutliFacetDynamicMemberLookup() throws {
        let product = Product(id: "1", name: "Rice", sku: "SKU", price: .eur(1.60))
        XCTAssertEqual(product.id, "1")
        XCTAssertEqual(product.name, "Rice")
        XCTAssertEqual(product.sku, "SKU")
        XCTAssertEqual(product.price, .eur(1.6))
    }
}

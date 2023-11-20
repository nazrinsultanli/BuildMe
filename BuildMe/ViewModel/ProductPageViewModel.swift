


import Foundation

class ProductPageViewModel {
    static let shared = ProductPageViewModel()
    var productData: [PRODUCTJs]

    init() {
        // Load data from FileManagerHelper
        productData = ProductJsGenerator.shared.readProducts()
    }

    var receivedProductId: Int = 0
    var favState: Bool = false
    var favProductData = [PRODUCTJs]()
    var temperoryFavProduct = [PRODUCTJs]()

    func getInfoById(id: Int) -> PRODUCTJs? {
        return productData.first { $0.idProduct == id }
    }

    func updateFavById(id: Int, state: Bool) {
        if let product = productData.first(where: { $0.idProduct == id }) {
            product.favorited = state
            ProductJsGenerator.shared.writeProducts(product: productData)
        }
    }
}


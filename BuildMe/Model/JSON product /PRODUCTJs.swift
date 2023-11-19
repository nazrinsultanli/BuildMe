import Foundation
import RealmSwift

@objcMembers
class PRODUCTJs: Object, Codable {
    @Persisted var idProduct: Int
    @Persisted var categoryType: String
    @Persisted var brandName: String
    @Persisted var modelName: String
    @Persisted var modelCode: String
    @Persisted var price: Double
    @Persisted var quantity: Int
    @Persisted var stock: Bool
    @Persisted var rating: Int
    @Persisted var imageName: String
    @Persisted var definition: String
    @Persisted var featured: Bool
    @Persisted var discounted: Bool
    @Persisted var new: Bool
    @Persisted var favorited: Bool
}

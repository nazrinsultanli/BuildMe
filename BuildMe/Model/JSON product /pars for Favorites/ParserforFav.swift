



import Foundation

class ParserforFav {
    static let shared = ParserforFav()

    private init() {}

    private func getFilePath(for fileName: String) -> URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent(fileName)
    }

    func readData<T: Decodable>(from fileName: String, completion: @escaping (T?) -> Void) {
        let filePath = getFilePath(for: fileName)

        do {
            let data = try Data(contentsOf: filePath)
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            completion(decodedData)
        } catch {
            print(error.localizedDescription)
            completion(nil)
        }
    }

    func writeData<T: Encodable>(to fileName: String, data: T) {
        let filePath = getFilePath(for: fileName)

        do {
            let encodedData = try JSONEncoder().encode(data)
            try encodedData.write(to: filePath)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
}

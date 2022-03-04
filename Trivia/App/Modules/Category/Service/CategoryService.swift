import Foundation

class CategoryService {
    
    func getCategories(onComplete: @escaping ([Category]) -> Void, onError: @escaping () -> Void) {
        
        ApiManager.shared.get(url: Constants().categoriesURL) { response in
            
            print(response)

            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let categoryResponse = try decoder.decode(CategoryResponse.self, from: data)
                        onComplete(categoryResponse.results)
                        print(categoryResponse)
                    } else {
                        onError()
                    }
                } catch {
                    onError()
                }
            case .failure(_):
                onError()
            }
        }
        
    }
}

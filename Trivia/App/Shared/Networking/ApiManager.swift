import Foundation
import Alamofire

class ApiManager{
    static let shared = ApiManager() //Instancio 1 sola vez, singleton
    
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void ){
        AF.request(url).response { response in
            completion(response.result)
        }
    }
}



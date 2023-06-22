//
//  NetworkClient.swift
//  TravelApp
//
//  Created by Melissa Zellhuber on 21/06/23.
//

import Foundation

struct NetworkClient {
    func sendRequest<T: Decodable>(request: NetworkRequest, completion: @escaping (Result<T, Error>) -> Void) {
        guard let urlRequest = request.urlRequest else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completion(.failure(NetworkError.requestFailed(error)))
                return
            }
            
            if let data = data {
                do {
                    // Print the JSON response
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    if let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted),
                       let jsonString = String(data: jsonData, encoding: .utf8) {
                        print("JSON Response:\n\(jsonString)")
                    }
                    
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(T.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(NetworkError.decodingFailed))
                }
            } else {
                completion(.failure(NetworkError.noData))
            }
        }
        
        task.resume()
    }
}

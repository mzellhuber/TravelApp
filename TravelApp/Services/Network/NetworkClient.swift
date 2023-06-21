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
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

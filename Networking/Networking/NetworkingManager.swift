//
//  NetworkingManager.swift
//  Networking
//
//  Created by Mariam Babutsidze on 26.04.23.
//

import Foundation
import OSLog

public protocol NetworkingManagerProtocol {
    func load(_ request: RequestProtocol) async throws -> Data
    func load<T: Decodable>(_ request: RequestProtocol) async throws -> T
}

public extension NetworkingManagerProtocol {
    
    func load<T: Decodable>(_ request: RequestProtocol) async throws -> T {
        let data = try await load(request)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        if let jsonString = String(data: data, encoding: .utf8) {
            Log.logger.log("Response Json: \(jsonString)")
        }
        do {
            let decoded = try decoder.decode(T.self, from: data)
            return decoded
        } catch {
            Log.logger.log(level: .error, "Parsing error \(error)")
            throw error
        }
    }
}

public class NetworkingManager: NetworkingManagerProtocol {
    private let urlSession: URLSession
    
    public init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    public func load(_ request: RequestProtocol) async throws -> Data {
        Log.logger.log("Host: \(request.host)")
        Log.logger.log("Path: \(request.path)")
        Log.logger.log("Headers: \(request.headers)")
        Log.logger.log("Query: \(request.query)")
        Log.logger.log("Body: \(request.body)")
        let (data, response) = try await urlSession.data(for: request.createURLRequest())
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200
        else {
            Log.logger.log("InvalidResponse: \(response)")
            throw NetworkError.invalidResponse
        }
        Log.logger.log("Data: \(data)")
        return data
    }
}

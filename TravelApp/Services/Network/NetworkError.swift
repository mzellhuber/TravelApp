//
//  NetworkError.swift
//  TravelApp
//
//  Created by Melissa Zellhuber on 21/06/23.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingFailed
    case noData
}

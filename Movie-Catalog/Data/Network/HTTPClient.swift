//
//  HTTPClient.swift
//  Movie-Catalog
//
//  Created by Богдан Тарченко on 21.10.2024.
//

protocol HTTPClient {
    func sendRequest<T: Decodable, U: Encodable>(endpoint: APIEndpoint, requestBody: U?, completion: @escaping (Result<T, Error>) -> Void)
}

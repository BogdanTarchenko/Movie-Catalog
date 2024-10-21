//
//  APIEndpoint.swift
//  Movie-Catalog
//
//  Created by Богдан Тарченко on 21.10.2024.
//

import Alamofire

protocol APIEndpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var headers: HTTPHeaders? { get }
}

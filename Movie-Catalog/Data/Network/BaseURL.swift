//
//  BaseURL.swift
//  Movie-Catalog
//
//  Created by Богдан Тарченко on 21.10.2024.
//

enum BaseURL {
    case kreosoft
    case kinopoisk

    var baseURL: String {
        switch self {
        case .kreosoft:
            return "https://react-midterm.kreosoft.space"
        case .kinopoisk:
            return "https://react-midterm.kreosoft.space"
        }
    }
}
//
//  String+Extensions.swift
//  Movie-Catalog
//
//  Created by Богдан Тарченко on 21.10.2024.
//

extension String {
    static var empty: String {
        return SC.empty
    }
    
    static var space: String {
        return SC.space
    }
    
    static var dash: String {
        return SC.dash
    }
}

typealias SC = StringConstants
enum StringConstants {
    
    static let empty = ""
    static let space = " "
    static let dash = "-"
}

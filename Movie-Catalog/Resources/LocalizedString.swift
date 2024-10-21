//
//  LocalizedString.swift
//  Movie-Catalog
//
//  Created by Богдан Тарченко on 21.10.2024.
//

import Foundation

enum LocalizedString {
    
    // MARK: Welcome
    static var welcomeMessage: String {
        return NSLocalizedString("welcome_message", comment: SC.empty)
    }
    
    static var welcomeSignInButtonTitle: String {
        return NSLocalizedString("welcome_sign_in_button_title", comment: SC.empty)
    }
    
    static var welcomeSignUpButtonTitle: String {
        return NSLocalizedString("welcome_sign_up_button_title", comment: SC.empty)
    }
    
    // MARK: Sign In
    static var signInTitle: String {
        return NSLocalizedString("sign_in_title", comment: SC.empty)
    }
    
    // MARK: Sign Up
    static var signUpTitle: String {
        return NSLocalizedString("sign_up_title", comment: SC.empty)
    }
}

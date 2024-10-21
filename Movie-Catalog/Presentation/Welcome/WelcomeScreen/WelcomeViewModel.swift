//
//  WelcomeViewModel.swift
//  Movie-Catalog
//
//  Created by Богдан Тарченко on 21.10.2024.
//

final class WelcomeViewModel {
    private let router: AppRouter
    
    init(router: AppRouter) {
        self.router = router
    }
    
    func signInButtonTapped() {
        router.navigateToSignIn()
    }
    
    func signUpButtonTapped() {
        router.navigateToSignUp()
    }
}

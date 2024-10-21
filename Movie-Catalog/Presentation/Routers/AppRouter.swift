//
//  AppRouter.swift
//  Movie-Catalog
//
//  Created by Богдан Тарченко on 21.10.2024.
//

import UIKit
import KeychainAccess

// MARK: - AppRouter
class AppRouter {
    
    private var window: UIWindow?
    
    // MARK: - Initializers
    init(window: UIWindow?) {
        self.window = window
    }
    
    // MARK: - Start App
    func start() {
        let keychain = Keychain()
        let welcomeViewModel = WelcomeViewModel(router: self)
        let welcomeViewController = WelcomeViewController(viewModel: welcomeViewModel)
        let navigationController = UINavigationController(rootViewController: welcomeViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

// MARK: - Navigation Methods
extension AppRouter {
    func navigateToSignIn() {
        let signInViewModel = SignInViewModel(router: self)
        let signInViewController = SignInViewController(viewModel: signInViewModel)
        navigateToViewController(signInViewController, title: LocalizedString.signInTitle)
    }
    
    func navigateToSignUp() {
        let signUpViewModel = SignUpViewModel(router: self)
        let signUpViewController = SignUpViewController(viewModel: signUpViewModel)
        navigateToViewController(signUpViewController, title: LocalizedString.signUpTitle)
    }
}

// MARK: - Navigation Bar Setup
extension AppRouter {
    func navigateToViewController(_ viewController: UIViewController, title: String) {
        guard let navigationController = window?.rootViewController as? UINavigationController else {
            return
        }
        
        setupNavigationBar(for: viewController, title: title)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func setupNavigationBar(for viewController: UIViewController, title: String) {
        viewController.navigationItem.hidesBackButton = true
        
        let titleLabel = createTitleLabel(with: title)
        let backButton = createBackButton()
        
        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        
        viewController.navigationItem.leftBarButtonItems = [
            backBarButtonItem,
            UIBarButtonItem(customView: titleLabel)
        ]
    }
    
    private func createTitleLabel(with title: String) -> UILabel {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = Constants.titleFont
        titleLabel.textColor = .white
        return titleLabel
    }
    
    private func createBackButton() -> UIButton {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "back_button"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return backButton
    }
    
    @objc private func backButtonTapped() {
        if let navigationController = window?.rootViewController as? UINavigationController {
            navigationController.popViewController(animated: true)
        }
    }
}

// MARK: - AppRouter.Constants
private extension AppRouter {
    enum Constants {
        static let titleFont = UIFont(name: "Manrope-Bold", size: 24) ?? UIFont.systemFont(ofSize: 24)
    }
}

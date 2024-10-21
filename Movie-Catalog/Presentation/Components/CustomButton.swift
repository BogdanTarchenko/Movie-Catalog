//
//  CustomButton.swift
//  Movie-Catalog
//
//  Created by Богдан Тарченко on 21.10.2024.
//

import UIKit
import SnapKit

class CustomButton: UIButton {
    
    // MARK: - Button Style
    enum ButtonStyle {
        case gradient
        case plain
        case inactive
        
        var titleColor: UIColor {
            switch self {
            case .gradient, .plain:
                return .textDefault
            case .inactive:
                return .grayFaded
            }
        }
        
        var backgroundColor: UIColor {
            switch self {
            case .gradient, .plain:
                return .darkFaded
            case .inactive:
                return .darkFaded
            }
        }
        
        var isUserInteractionEnabled: Bool {
            switch self {
            case .inactive:
                return false
            default:
                return true
            }
        }
    }
    
    // MARK: - Properties
    private var buttonStyle: ButtonStyle
    
    // MARK: - Initializers
    init(style: ButtonStyle) {
        self.buttonStyle = style
        super.init(frame: .zero)
        setupButton()
        configureStyle()
    }
    
    required init?(coder: NSCoder) {
        self.buttonStyle = .plain
        super.init(coder: coder)
        setupButton()
        configureStyle()
    }
    
    // MARK: - Setup Methods
    private func setupButton() {
        layer.cornerRadius = Constants.cornerRadius
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont(name: Constants.fontName, size: Constants.fontSize)
        
        snp.makeConstraints { make in
            make.height.equalTo(Constants.buttonHeight)
        }
    }
    
    private func configureStyle() {
        removeExistingGradientLayers()
        
        backgroundColor = buttonStyle.backgroundColor
        setTitleColor(buttonStyle.titleColor, for: .normal)
        isUserInteractionEnabled = buttonStyle.isUserInteractionEnabled
        
        if buttonStyle == .gradient {
            applyGradientBackground()
        }
    }
    
    // MARK: - Gradient Methods
    private func removeExistingGradientLayers() {
        layer.sublayers?.forEach { layer in
            if layer is CAGradientLayer {
                layer.removeFromSuperlayer()
            }
        }
    }
    
    private func applyGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = Constants.gradientColors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = layer.cornerRadius
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    // MARK: - Highlight Handling
    override var isHighlighted: Bool {
        didSet {
            updateButtonAppearance(for: isHighlighted)
        }
    }
    
    private func updateButtonAppearance(for highlighted: Bool) {
        let targetAlpha: CGFloat = highlighted ? 0.7 : 1.0
        UIView.animate(withDuration: 0.1) {
            self.alpha = targetAlpha
        }
    }
    
    // MARK: - Layout Handling
    override func layoutSubviews() {
        super.layoutSubviews()
        if let gradientLayer = layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = bounds
        }
    }
    
    // MARK: - Style Toggling
    func toggleStyle(_ style: ButtonStyle) {
        buttonStyle = style
        configureStyle()
    }
}

// MARK: - Constants
extension CustomButton {
    private enum Constants {
        static let cornerRadius: CGFloat = 8
        static let buttonHeight: CGFloat = 48
        static let fontName: String = "Manrope-Bold"
        static let fontSize: CGFloat = 14
        static let gradientColors: [CGColor] = [
            UIColor(red: 223/255, green: 40/255, blue: 0/255, alpha: 1).cgColor,
            UIColor(red: 255/255, green: 102/255, blue: 51/255, alpha: 1).cgColor
        ]
    }
}

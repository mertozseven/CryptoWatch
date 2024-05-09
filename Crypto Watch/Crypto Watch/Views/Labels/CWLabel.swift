//
//  CWLabel.swift
//  Crypto Watch
//
//  Created by Mert Ozseven on 2.05.2024.
//

import UIKit

class CWLabel: UILabel {

    // MARK: - inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(
        text: String,
        textAlignment: NSTextAlignment,
        textColor: UIColor,
        font: UIFont,
        backgroundColor: UIColor = .clear,
        cornerRadius: CGFloat = 0,
        isUserInteractionEnabled: Bool = false,
        numberOfLines: Int = 1
    ) {
        super.init(frame: .zero)
        self.text = text
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.font = font
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.isUserInteractionEnabled = isUserInteractionEnabled
        self.numberOfLines = numberOfLines
        configure()
    }
    
    // MARK: - Private Methods
    private func configure() {
        clipsToBounds = true
        minimumScaleFactor = 0.76
        adjustsFontSizeToFitWidth = true
        lineBreakMode = .byTruncatingTail
    }

}

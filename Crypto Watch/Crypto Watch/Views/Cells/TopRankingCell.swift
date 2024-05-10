//
//  TopRankingCell.swift
//  Crypto Watch
//
//  Created by Mert Ozseven on 1.05.2024.
//

import UIKit
import SnapKit
import Kingfisher

class TopRankingCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "TopRankingCell"
    
    private var color: String?
    
    // MARK: - UI Components
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .tertiarySystemBackground
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    private let coinIcon: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = 20
        
        return imageview
    }()
    
    private let symbolNameLabel = CWLabel(text: "BTC", textAlignment: .left, textColor: .secondaryLabel, font: .systemFont(ofSize: 16, weight: .regular))
    private let coinNameLabel = CWLabel(text: "Bitcoin", textAlignment: .left, textColor: .label, font: .systemFont(ofSize: 18, weight: .bold))
    private let priceLabel = CWLabel(text: "16000$", textAlignment: .right, textColor: .label, font: .systemFont(ofSize: 18, weight: .bold))
    private let changeLabel = CWLabel(text: "-3.6", textAlignment: .right, textColor: .systemRed, font: .systemFont(ofSize: 16, weight: .regular))
    
    // MARK: - inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    public func configure(with coinUrl: URL, symbolName: String, coinName: String, price: String, change: String) {
        coinIcon.kf.setImage(with: coinUrl)
        self.symbolNameLabel.text = symbolName
        self.coinNameLabel.text = coinName
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "en_US")

        if let priceNumber = Double(price) {
            if priceNumber < 1.1 {
                let formattedPrice = formatSmallNumber(priceNumber)
                self.priceLabel.text = "$\(formattedPrice)"
                numberFormatter.minimumFractionDigits = 8
            } else {
                self.priceLabel.text = numberFormatter.string(from: NSNumber(value: priceNumber))
                numberFormatter.minimumFractionDigits = 3
            }
        }

        if let changeNumber = Double(change), let priceNumber = Double(price) {
            let changeComputed = priceNumber * changeNumber / 100
            self.changeLabel.text = String(format: "%%\(change) (%@)", numberFormatter.string(from: NSNumber(value: changeComputed)) ?? "")
            self.changeLabel.textColor = changeNumber > 0 ? .systemGreen : .systemRed
        }
        
        configureView()
    }
    
    // MARK: - Private Methods
    private func configureView() {
        addViews()
        configureLayout()
        changeLabel.minimumScaleFactor = 0.5
        changeLabel.lineBreakMode = .byCharWrapping
    }
    
    private func addViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(coinIcon)
        containerView.addSubview(symbolNameLabel)
        containerView.addSubview(coinNameLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(changeLabel)
    }
    
    private func configureLayout() {
        containerView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(8)
        }
        coinIcon.snp.makeConstraints {
            $0.width.height.equalTo(40)
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        symbolNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalTo(coinIcon.snp.trailing).offset(16)
            $0.trailing.equalTo(containerView.snp.centerX).inset(8)
            $0.height.equalTo(18)
        }
        coinNameLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(16)
            $0.leading.equalTo(coinIcon.snp.trailing).offset(16)
            $0.trailing.equalTo(containerView.snp.centerX)
            $0.height.equalTo(18)
        }
        priceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.leading.equalTo(containerView.snp.centerX)
            $0.height.equalTo(16)
        }
        changeLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.leading.equalTo(containerView.snp.centerX)
            $0.height.equalTo(20)
        }
    }

    private func formatSmallNumber(_ number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        guard let formattedNumber = formatter.string(from: NSNumber(value: number)) else { return "\(number)" }
        let parts = formattedNumber.split(separator: ".")
        if parts.count == 2 {
            let integerPart = parts[0]
            let fractionalDigits = parts[1]
            let formattedFractionalPart = fractionalDigits.enumerated().map { index, character -> String in
                return index < fractionalDigits.count - 1 && character == "0" ? "." : String(character)
            }.joined()
            return "\(integerPart).\(formattedFractionalPart)$"
        }
        
        return formattedNumber
    }

    // MARK: - Handle reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        coinIcon.image = nil
        symbolNameLabel.text = ""
        coinNameLabel.text = ""
        priceLabel.text = ""
        changeLabel.text = ""
    }
    
}


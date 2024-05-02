//
//  TopRankingCell.swift
//  Crypto Watch
//
//  Created by Mert Ozseven on 1.05.2024.
//

import UIKit
import SnapKit

class TopRankingCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "TopRankingCell"
    
    // MARK: - UI Components
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray6.cgColor
        
        return view
    }()
    
    private let coinIcon: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = 20
        imageview.image = UIHelper.resizeImage(image: UIImage(named: "bitcoin")!, targetSize: CGSize(width: 40, height: 40))
        
        return imageview
    }()
    
    private let symbolNameLabel = CWLabel(text: "BTC", textAlignment: .left, textColor: .secondaryLabel, font: .systemFont(ofSize: 16, weight: .regular))
    
    private let coinNameLabel = CWLabel(text: "Bitcoin", textAlignment: .left, textColor: .label, font: .systemFont(ofSize: 16, weight: .bold))
    
    private let priceLabel = CWLabel(text: "16000$", textAlignment: .right, textColor: .label, font: .systemFont(ofSize: 16, weight: .bold))
    
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
    public func configure(with coinIcon: UIImage, symbolName: String, coinName: String) {
        self.coinIcon.image = coinIcon
        self.symbolNameLabel.text = symbolName
        self.coinNameLabel.text = coinName
        configureView()
    }
    
    // MARK: - Private Methods
    private func configureView() {
        addViews()
        configureLayout()
        let allowedCharacters = CharacterSet(charactersIn: "0123456789.,")
        let filteredText = priceLabel.text?.filter { String($0).rangeOfCharacter(from: allowedCharacters) != nil } ?? ""
        if let price = Double(filteredText.replacingOccurrences(of: ",", with: "")) {
            let change = price * -3.12 / 100
            changeLabel.text = String(format: "%%-3.12 (%.2f$)", change)
        }
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
            $0.bottom.equalToSuperview().inset(16)
        }
        coinIcon.snp.makeConstraints {
            $0.width.height.equalTo(40)
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        symbolNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(coinIcon.snp.centerY).inset(24)
            $0.leading.equalTo(coinIcon.snp.trailing).offset(16)
            $0.trailing.equalTo(containerView.snp.centerX).inset(8)
            $0.height.equalTo(16)
        }
        coinNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(24)
            $0.leading.equalTo(coinIcon.snp.trailing).offset(16)
            $0.trailing.equalTo(containerView.snp.centerX).inset(8)
            $0.height.equalTo(16)
        }
        priceLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().inset(24)
            $0.trailing.equalToSuperview().inset(16)
            $0.leading.equalTo(containerView.snp.centerX).offset(8)
            $0.height.equalTo(16)
        }
        changeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().inset(16)
            $0.leading.equalTo(containerView.snp.centerX).offset(8)
            $0.height.equalTo(16)
        }
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

#Preview {
    TopRankingCell()
}

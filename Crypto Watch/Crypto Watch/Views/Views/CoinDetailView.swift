//
//  CoinDetailView.swift
//  Crypto Watch
//
//  Created by Mert Ozseven on 9.05.2024.
//

import UIKit

final class CoinDetailView: UIView {
    
    // MARK: - Properties
    var coin: Coin?
    
    // MARK: - UI Components
    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .tertiarySystemBackground
        
        return view
    }()
    
    private let priceTitleLabel = CWLabel(text: "Current Price",
                                          textAlignment: .left,
                                          textColor: .secondaryLabel,
                                          font: .preferredFont(forTextStyle: .subheadline))
    
    private let priceLabel = CWLabel(text: "54000.6752$",
                                     textAlignment: .left,
                                     textColor: .label,
                                     font: .preferredFont(forTextStyle: .headline))
    
    private let changeTitleLabel = CWLabel(text: "Change",
                                           textAlignment: .left,
                                           textColor: .secondaryLabel,
                                           font: .preferredFont(forTextStyle: .subheadline))
    
    private let changeLabel = CWLabel(text: "% -3.14",
                                      textAlignment: .left,
                                      textColor: .systemRed,
                                      font: .preferredFont(forTextStyle: .headline))
    
    private let marketCapTitleLabel = CWLabel(text: "Market Cap",
                                              textAlignment: .left,
                                              textColor: .secondaryLabel,
                                              font: .preferredFont(forTextStyle: .subheadline))
    
    private let marketCapLabel = CWLabel(text: "1064845170034",
                                         textAlignment: .left,
                                         textColor: .label,
                                         font: .preferredFont(forTextStyle: .headline))
    
    private let dailyVolumeTitleLabel = CWLabel(text: "24 Hours Volume",
                                                textAlignment: .left,
                                                textColor: .secondaryLabel,
                                                font: .preferredFont(forTextStyle: .subheadline))
    
    private let dailyVolumeLabel = CWLabel(text: "39591261551",
                                           textAlignment: .left,
                                           textColor: .label,
                                           font: .preferredFont(forTextStyle: .headline))
    
    private let rankTitleLabel = CWLabel(text: "Rank",
                                         textAlignment: .left,
                                         textColor: .secondaryLabel,
                                         font: .preferredFont(forTextStyle: .subheadline))
    
    private let rankLabel = CWLabel(text: "1",
                                    textAlignment: .left,
                                    textColor: .label,
                                    font: .preferredFont(forTextStyle: .headline))
    
    private let coinRankingTitleLabel = CWLabel(text: "Coin Ranking Page",
                                                textAlignment: .left,
                                                textColor: .secondaryLabel,
                                                font: .preferredFont(forTextStyle: .subheadline))
    
    private let coinRankingLabel = CWLabel(text: "https://coinranking.com/coin/Qwsogvtv82FCd+bitcoin-btc",
                                           textAlignment: .left,
                                           textColor: .label,
                                           font: .preferredFont(forTextStyle: .headline))
    
    private let lineChartView = LineChartView()
    
    // MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    public func configure(with coin: Coin) {
        self.coin = coin
        configureNumbers()
    }
    
    // MARK: - Private Methods
    private func configureView() {
        addViews()
        configureLayout()
    }
    
    private func addViews() {
        addSubview(containerView)
        containerView.addSubview(priceTitleLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(changeTitleLabel)
        containerView.addSubview(changeLabel)
        containerView.addSubview(marketCapTitleLabel)
        containerView.addSubview(marketCapLabel)
        containerView.addSubview(dailyVolumeTitleLabel)
        containerView.addSubview(dailyVolumeLabel)
        containerView.addSubview(rankTitleLabel)
        containerView.addSubview(rankLabel)
        containerView.addSubview(coinRankingTitleLabel)
        containerView.addSubview(coinRankingLabel)
        containerView.addSubview(lineChartView)
    }
    
    private func configureLayout() {
        containerView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        priceTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalTo(containerView.snp.centerX).inset(16)
            $0.height.equalTo(16)
        }
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(priceTitleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalTo(containerView.snp.centerX).inset(16)
            $0.height.equalTo(20)
        }
        changeTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalTo(containerView.snp.centerX).offset(8)
            $0.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(16)
        }
        changeLabel.snp.makeConstraints {
            $0.top.equalTo(changeTitleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(changeTitleLabel)
            $0.height.equalTo(20)
        }
        marketCapTitleLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalTo(containerView.snp.centerX).inset(16)
            $0.height.equalTo(16)
        }
        marketCapLabel.snp.makeConstraints {
            $0.top.equalTo(marketCapTitleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(marketCapTitleLabel)
            $0.height.equalTo(20)
        }
        dailyVolumeTitleLabel.snp.makeConstraints {
            $0.top.equalTo(changeLabel.snp.bottom).offset(16)
            $0.leading.equalTo(containerView.snp.centerX).offset(8)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(16)
        }
        dailyVolumeLabel.snp.makeConstraints {
            $0.top.equalTo(dailyVolumeTitleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(dailyVolumeTitleLabel)
            $0.height.equalTo(20)
        }
        lineChartView.snp.makeConstraints {
            $0.top.equalTo(dailyVolumeLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.bottom.equalToSuperview().inset(16)
            
        }
    }
    
    private func configureNumbers() {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "en_US")
        
        if let priceNumber = Double(coin?.price ?? "") {
            if priceNumber < 0.001 {
                numberFormatter.minimumFractionDigits = 8
                priceLabel.text = "$\(formatSmallNumber(priceNumber))"
            } else {
                numberFormatter.minimumFractionDigits = 3
                priceLabel.text = numberFormatter.string(from: NSNumber(value: priceNumber))
            }
        }
        
        if let change = coin?.change, let priceNumber = Double(coin?.price ?? ""), let changeNumber = Double(change) {
            let changeComputed = priceNumber * changeNumber / 100
            changeLabel.text = String(format: "%%\(change) (%@)", numberFormatter.string(from: NSNumber(value: changeComputed)) ?? "")
            changeLabel.textColor = changeNumber > 0 ? .systemGreen : .systemRed
            if changeNumber > 0 {
                changeLabel.textColor = .systemGreen
                lineChartView.configure(lineColor: .systemGreen)
            } else {
                changeLabel.textColor = .systemRed
                lineChartView.configure(lineColor: .systemRed)
            }
        }
        
        if let marketCap = coin?.marketCap, let marketCapNumber = Double(marketCap) {
            numberFormatter.minimumFractionDigits = 0
            marketCapLabel.text = numberFormatter.string(from: NSNumber(value: marketCapNumber))
        }
        
        if let dailyVolumeNumber = Double(coin?.the24HVolume ?? "") {
            numberFormatter.minimumFractionDigits = 0
            dailyVolumeLabel.text = numberFormatter.string(from: NSNumber(value: dailyVolumeNumber))
        }
        
        lineChartView.setSparklineData(coin?.sparkline ?? [])
        
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
            return "\(integerPart).\(formattedFractionalPart)"
        }
        
        return formattedNumber
    }
    
}

//
//  DetailViewController.swift
//  Crypto Watch
//
//  Created by Mert Ozseven on 5.05.2024.
//

import UIKit
import SnapKit
import Kingfisher

final class DetailViewController: UIViewController {
    
    // MARK: - Properties
    var coin: Coin!
    
    // MARK: - UI Components
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 16
        
        return button
    }()
    
    private let scrollView = UIScrollView()
    
    private let contentView = UIView()
    
    private let coinIcon: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = 64
        
        return imageview
    }()
    
    private let name = CWLabel(text: "Bitcoin", textAlignment: .center, textColor: .label, font: .systemFont(ofSize: 32, weight: .heavy))
    
    private let symbol = CWLabel(text: "BTC", textAlignment: .center, textColor: .secondaryLabel, font: .systemFont(ofSize: 24, weight: .heavy))

    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .tertiarySystemBackground
        
        return view
    }()
    
    private let priceTitleLabel = CWLabel(text: "Price", textAlignment: .left, textColor: .secondaryLabel, font: .preferredFont(forTextStyle: .subheadline))
    
    private let priceLabel = CWLabel(text: "54000.6752$", textAlignment: .left, textColor: .label, font: .preferredFont(forTextStyle: .headline))
    
    private let changeTitleLabel = CWLabel(text: "Change", textAlignment: .left, textColor: .secondaryLabel, font: .preferredFont(forTextStyle: .subheadline))
    
    private let changeLabel = CWLabel(text: "% -3.14", textAlignment: .left, textColor: .systemRed, font: .preferredFont(forTextStyle: .headline))
    
    
    
    private let linkIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "link")
        imageView.clipsToBounds = true
        imageView.tintColor = .secondaryLabel
        
        return imageView
    }()
    
    private let linkLabel = CWLabel(text: "Coin Ranking Page", textAlignment: .center, textColor: .secondaryLabel, font: .preferredFont(forTextStyle: .subheadline))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    init(coin: Coin) {
        self.coin = coin
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        addViews()
        configureLayout()
        configureBackButton()
        configureCoinIcon()
        configureComponents()
        view.backgroundColor = .secondarySystemBackground
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func addViews() {
        view.addSubview(backButton)
//        view.addSubview(scrollView)
//        scrollView.addSubview(contentView)
        view.addSubview(coinIcon)
        view.addSubview(name)
        view.addSubview(symbol)
        view.addSubview(containerView)
        containerView.addSubview(priceTitleLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(changeTitleLabel)
        containerView.addSubview(changeLabel)
    }
    
    private func configureLayout() {
        backButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            $0.leading.equalToSuperview().offset(16)
            $0.height.width.equalTo(32)
        }
        coinIcon.snp.makeConstraints {
            $0.top.equalTo(backButton.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(128)
        }
        name.snp.makeConstraints {
            $0.top.equalTo(coinIcon.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(36)
        }
        symbol.snp.makeConstraints {
            $0.top.equalTo(name.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(28)
        }
        containerView.snp.makeConstraints {
            $0.top.equalTo(symbol.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        priceTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalTo(containerView.snp.centerX).inset(8)
            $0.height.equalTo(16)
        }
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(priceTitleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalTo(containerView.snp.centerX).inset(8)
            $0.height.equalTo(18)
        }
        changeTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalTo(containerView.snp.centerX)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(16)
        }
        changeLabel.snp.makeConstraints {
            $0.top.equalTo(changeTitleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(containerView.snp.centerX)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(18)
        }
    }
    
    private func configureBackButton() {
        backButton.backgroundColor = UIColor(hex: "\(self.coin.color ?? "#0A84FF")" , alpha: 1.0)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
    }
    
    private func configureCoinIcon() {
        let modifiedCoinIconUrl = URL(string: coin.iconURL!.replacingOccurrences(of: "svg", with: "png"))!
        coinIcon.kf.setImage(with: modifiedCoinIconUrl)
    }
    
    private func configureComponents() {
        name.text = coin.name
        symbol.text = coin.symbol
        self.priceLabel.text = String(format: "%05.4f$", Double(coin.price!) ?? 0)
        let changeComputed = (Double(coin.price!) ?? 0) * (Double(coin.change!) ?? 0) / 100
        changeLabel.text = String(format: "%%\(coin.change ?? "") (%04.4f$)", changeComputed)
        if Double(coin.change!) ?? 0 > 0 {
            changeLabel.textColor = .systemGreen
        }
    }
    
    // MARK: - Objective Methods
    @objc private func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
}

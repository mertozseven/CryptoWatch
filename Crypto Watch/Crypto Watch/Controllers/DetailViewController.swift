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
    
    private let coinIcon: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = 64
        
        return imageview
    }()
    
    private let name = CWLabel(text: "Bitcoin", textAlignment: .center, textColor: .label, font: .systemFont(ofSize: 32, weight: .heavy))
    private let symbol = CWLabel(text: "BTC", textAlignment: .center, textColor: .secondaryLabel, font: .systemFont(ofSize: 24, weight: .heavy))
    
    private let coinDetailView = CoinDetailView()
    
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
        coinDetailView.configure(with: coin)
        view.backgroundColor = .secondarySystemBackground
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func addViews() {
        view.addSubview(backButton)
        view.addSubview(coinIcon)
        view.addSubview(name)
        view.addSubview(symbol)
        view.addSubview(coinDetailView)
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
        coinDetailView.snp.makeConstraints {
            $0.top.equalTo(symbol.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
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
    }
    
    
    // MARK: - Objective Methods
    @objc private func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
}

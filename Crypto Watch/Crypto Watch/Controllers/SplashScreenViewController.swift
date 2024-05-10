//
//  SplashScreenViewController.swift
//  Crypto Watch
//
//  Created by Mert Ozseven on 5.05.2024.
//

import UIKit
import SnapKit

class SplashScreenViewController: UIViewController {
    
    // MARK: - UI Components
    private let welcomeLabel = CWLabel(
        text: "Welcome to \nCrypto Watch",
        textAlignment: .center,
        textColor: .label,
        font: .systemFont(ofSize: 40,weight: .bold),
        numberOfLines: 0,
        adjustsFontSizeToFitWidth: false
    )
    
    private let cryptoIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bitcoinsign.circle.fill")
        imageView.tintColor = .systemYellow
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let cryptoTitleDescription = CWLabel(
        text: "Latest Crypto",
        textAlignment: .left,
        textColor: .label,
        font: .preferredFont(forTextStyle: .title2),
        adjustsFontSizeToFitWidth: false
    )
    
    private let cryptoDescription = CWLabel(
        text: "Find and latest and greatest crypto coins 🚀",
        textAlignment: .left,
        textColor: .secondaryLabel,
        font: .preferredFont(forTextStyle: .body),
        numberOfLines: 0,
        adjustsFontSizeToFitWidth: false
    )
    
    private let chartIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chart.line.uptrend.xyaxis")
        imageView.tintColor = .systemGreen
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let chartTitleDescription = CWLabel(
        text: "See Trends",
        textAlignment: .left,
        textColor: .label,
        font: .preferredFont(forTextStyle: .title2),
        adjustsFontSizeToFitWidth: false
    )
    
    private let chartDescription = CWLabel(
        text: "Is it Bear or is it Bull? Check the current trends on the crypto market 🎯",
        textAlignment: .left,
        textColor: .secondaryLabel,
        font: .preferredFont(forTextStyle: .body),
        numberOfLines: 0,
        adjustsFontSizeToFitWidth: false
    )
    
    private let devicesIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "laptopcomputer.and.iphone")
        imageView.tintColor = .systemBlue
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let devicesTitleDescription = CWLabel(
        text: "Connect From Anywhere",
        textAlignment: .left,
        textColor: .label,
        font: .preferredFont(forTextStyle: .title2),
        adjustsFontSizeToFitWidth: false
    )
    
    private let devicesDescription = CWLabel(
        text: "Crypto Watch is avaliable on all Apple products. Track currents market from anywhere 💻",
        textAlignment: .left,
        textColor: .secondaryLabel,
        font: .preferredFont(forTextStyle: .body),
        numberOfLines: 0,
        adjustsFontSizeToFitWidth: false
    )
    
    private let continueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        button.titleLabel?.textAlignment = .center
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    // MARK: - Private Methods
    private func configureView() {
        addViews()
        configureLayout()
        continueButtonTapped()
        view.backgroundColor = .systemBackground
    }
    
    private func addViews() {
        view.addSubview(welcomeLabel)
        view.addSubview(cryptoIcon)
        view.addSubview(cryptoTitleDescription)
        view.addSubview(cryptoDescription)
        view.addSubview(chartIcon)
        view.addSubview(chartTitleDescription)
        view.addSubview(chartDescription)
        view.addSubview(devicesIcon)
        view.addSubview(devicesTitleDescription)
        view.addSubview(devicesDescription)
        view.addSubview(continueButton)
    }
    
    private func configureLayout() {
        welcomeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(80)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(88)
        }
        cryptoIcon.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(40)
            $0.height.width.equalTo(56)
            $0.top.equalTo(cryptoTitleDescription.snp.top).offset(12)
        }
        cryptoTitleDescription.snp.makeConstraints {
            $0.leading.equalTo(cryptoIcon.snp.trailing).offset(16)
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(32)
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.height.equalTo(32)
        }
        cryptoDescription.snp.makeConstraints {
            $0.leading.equalTo(cryptoIcon.snp.trailing).offset(16)
            $0.top.equalTo(cryptoTitleDescription.snp.bottom).offset(4)
            $0.width.equalTo(UIScreen.main.bounds.width / 2 + 40)
            $0.height.equalTo(40)
        }
        chartIcon.snp.makeConstraints {
            $0.top.equalTo(chartTitleDescription.snp.top).offset(16)
            $0.width.height.equalTo(56)
            $0.leading.equalTo(cryptoIcon.snp.leading)
        }
        chartTitleDescription.snp.makeConstraints {
            $0.leading.equalTo(chartIcon.snp.trailing).offset(16)
            $0.top.equalTo(cryptoDescription.snp.bottom).offset(24)
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.height.equalTo(24)
        }
        chartDescription.snp.makeConstraints {
            $0.leading.equalTo(cryptoIcon.snp.trailing).offset(16)
            $0.top.equalTo(chartTitleDescription.snp.bottom).offset(2)
            $0.width.equalTo(UIScreen.main.bounds.width / 2 + 40)
            $0.height.equalTo(72)
        }
        devicesIcon.snp.makeConstraints {
            $0.top.equalTo(devicesTitleDescription.snp.top).offset(24)
            $0.width.height.equalTo(56)
            $0.leading.equalTo(cryptoIcon.snp.leading)
        }
        devicesTitleDescription.snp.makeConstraints {
            $0.top.equalTo(chartDescription.snp.bottom).offset(24)
            $0.leading.equalTo(devicesIcon.snp.trailing).offset(16)
            $0.height.equalTo(24)
            $0.width.equalTo(UIScreen.main.bounds.width / 2 + 40)
        }
        devicesDescription.snp.makeConstraints {
            $0.leading.equalTo(devicesTitleDescription)
            $0.top.equalTo(devicesTitleDescription.snp.bottom).offset(4)
            $0.width.equalTo(UIScreen.main.bounds.width / 2 + 32)
            $0.height.equalTo(72)
        }
        continueButton.snp.makeConstraints {
            $0.bottom.equalTo(view.snp.bottom).inset(40)
            $0.width.equalTo(UIScreen.main.bounds.width / 2 + 40)
            $0.height.equalTo(48)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func continueButtonTapped() {
        continueButton.addTarget(self, action: #selector(continueButtonAction), for: .touchUpInside)
    }
    
    @objc private func continueButtonAction() {
        dismiss(animated: true)
    }

}


//
//  CWTopNavigationView.swift
//  Crypto Watch
//
//  Created by Mert Ozseven on 1.05.2024.
//

import UIKit
import SnapKit

class CWTopNavigationView: UIView {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 44, weight: .black)
        label.text = "Crypto\nWatch"
        label.textColor = .label
        label.numberOfLines = 0
        
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .heavy)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    // MARK: - inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    public func configureWithCurrentDateAndGreeting() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = " E d MMM"
        let currentDate = dateFormatter.string(from: Date())
        dateLabel.text = currentDate
    }
    
    // MARK: - Private methods
    private func configureView() {
        backgroundColor = .clear
        addViews()
        configureLayout()
        configureWithCurrentDateAndGreeting()
    }
    
    private func addViews() {
        addSubview(titleLabel)
        addSubview(dateLabel)
    }
    
    private func configureLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(106)
        }
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

}

#Preview {
    CWTopNavigationView()
}

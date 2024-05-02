//
//  ViewController.swift
//  Crypto Watch
//
//  Created by Mert Ozseven on 1.05.2024.
//

import UIKit

class RankingListViewController: UIViewController {
    
    // MARK: - UI Components
    private let scrollView = UIScrollView()
    
    private let contentView = UIView()
    
    private let topView = CWTopNavigationView()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TopRankingCell.self, forCellWithReuseIdentifier: TopRankingCell.identifier)
        collectionView.isScrollEnabled = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isUserInteractionEnabled = true
        
        return collectionView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    // MARK: - Private Methods
    private func configureView() {
        addViews()
        configureLayout()
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func addViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(topView)
        contentView.addSubview(collectionView)
    }
    
    private func configureLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.greaterThanOrEqualToSuperview()
            $0.height.greaterThanOrEqualToSuperview()
            $0.bottom.equalTo(collectionView.snp.bottom)
        }
        topView.snp.makeConstraints {
            $0.top.equalTo(contentView.safeAreaLayoutGuide.snp.top).inset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(136)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50 * 96)
        }
    }

}

extension RankingListViewController: UICollectionViewDelegate {
    
}

extension RankingListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopRankingCell.identifier, for: indexPath) as? TopRankingCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
}

extension RankingListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width - 32
                return CGSize(width: screenWidth, height: 96)
    }
    
}

#Preview {
    RankingListViewController()
}

//
//  ViewController.swift
//  Crypto Watch
//
//  Created by Mert Ozseven on 1.05.2024.
//

import UIKit
import SnapKit
import Alamofire

final class RankingListViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel: CoinResultsViewModel
    
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
        collectionView.backgroundColor = .clear
        collectionView.isUserInteractionEnabled = true
        
        return collectionView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    init(viewModel: CoinResultsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func configureView() {
        addViews()
        configureLayout()
        view.backgroundColor = .secondarySystemBackground
        navigationController?.setNavigationBarHidden(true, animated: false)
        getCoins()
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
            $0.leading.equalTo(view)
            $0.trailing.equalTo(view)
            $0.height.equalTo(50 * 84)
        }
    }
    
    private func getCoins() {
        guard let url = URL(string: Constants.url) else {
            print("Invalid URL")
            return
        }
        AF.request(url).responseDecodable(of: CoinResults.self) { [weak self] response in
            guard let self = self else { return }
            
            switch response.result {
            case .success(let welcomeData):
                self.viewModel.coins = (welcomeData.data?.coins)!
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print("Error fetching coins: \(error.localizedDescription)")
            }
        }
    }
    
}

extension RankingListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedCoin = viewModel.coins?[indexPath.row] else { return }
        let detailVC = DetailViewController(coin: selectedCoin)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

extension RankingListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.coins?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopRankingCell.identifier, for: indexPath) as? TopRankingCell,
              let coin = viewModel[indexPath.row] else {
            return UICollectionViewCell()
        }
        let modifiedCoinIconUrl = URL(string: coin.iconURL!.replacingOccurrences(of: "svg", with: "png"))!
        cell.configure(with: modifiedCoinIconUrl, symbolName: coin.symbol ?? "", coinName: coin.name ?? "", price: coin.price ?? "", change: coin.change ?? "")
        return cell
    }
    
}

extension RankingListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width - 32
        return CGSize(width: screenWidth, height: 84)
    }
    
}


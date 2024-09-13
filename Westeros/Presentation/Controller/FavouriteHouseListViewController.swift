//
//  FavouriteHouseListViewController.swift
//  Westeros
//
//  Created by Adrián Silva on 12/9/24.
//

import UIKit

final class FavouriteHouseListViewController: UICollectionViewController {
    // MARK: - DataSource
    typealias DataSource = UICollectionViewDiffableDataSource<Int, House>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, House>
    
    // MARK: - Model
    private let favouriteHouses = [House]()
    private var dataSource: DataSource?
    
    // MARK: - Initializers
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 125)
        layout.scrollDirection = .vertical
        super.init(collectionViewLayout: layout)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let registration = UICollectionView.CellRegistration<
            FavouriteHouseCollectionViewCell,
            House
        >(cellNib: UINib(nibName: FavouriteHouseCollectionViewCell.identifier, bundle: nil)) { cell, _, house in
            cell.configure(with: house)
        }
        
        dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, house in
            collectionView.dequeueConfiguredReusableCell(
                using: registration, 
                for: indexPath, 
                item: house
            )
        }
        
        collectionView.dataSource = dataSource
        
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(favouriteHouses)
        
        dataSource?.apply(snapshot)
    }
    
}

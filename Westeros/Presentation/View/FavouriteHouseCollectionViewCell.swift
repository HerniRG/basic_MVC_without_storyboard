//
//  FavouriteHouseCollectionViewCell.swift
//  Westeros
//
//  Created by Adrián Silva on 12/9/24.
//

import UIKit

final class FavouriteHouseCollectionViewCell: UICollectionViewCell {
    // MARK - Identifier
    static let identifier = String(describing: FavouriteHouseCollectionViewCell.self)
    // MARK: - Outlets
    @IBOutlet weak var houseNameLabel: UILabel!
    // MARK: - Configuration
    func configure(with house: House) {
        houseNameLabel.text = house.rawValue
    }
}

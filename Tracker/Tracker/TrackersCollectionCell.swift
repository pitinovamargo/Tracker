//
//  TrackersCollectionCell.swift
//  Tracker
//
//  Created by Margarita Pitinova on 10.07.2023.
//

import UIKit

final class TrackersCollectionCell: UICollectionViewCell {
    let titleLabel = UILabel()
    // Идентификатор ячейки — используется для регистрации и восстановления:
    
    override init(frame: CGRect) {                  // 1
        super.init(frame: frame)                    // 2
        
        contentView.addSubview(titleLabel)          // 3
        titleLabel.translatesAutoresizingMaskIntoConstraints = false    // 4
       
       NSLayoutConstraint.activate([                                    // 5
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

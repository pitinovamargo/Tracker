//
//  TrackersCollectionCell.swift
//  Tracker
//
//  Created by Margarita Pitinova on 10.07.2023.
//

import UIKit

final class TrackersCollectionCell: UICollectionViewCell {
    let dayCount = UILabel()
    let descriptionCard = UILabel()
    let colorCard = UIView()
    let buttonCheck = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 5
        contentView.layer.masksToBounds = true
        
        contentView.addSubview(dayCount)
        contentView.addSubview(descriptionCard)
        contentView.addSubview(colorCard)
        contentView.addSubview(buttonCheck)
        
        dayCount.translatesAutoresizingMaskIntoConstraints = false
        descriptionCard.translatesAutoresizingMaskIntoConstraints = false
        colorCard.translatesAutoresizingMaskIntoConstraints = false
        buttonCheck.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            colorCard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            colorCard.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            descriptionCard.leadingAnchor.constraint(equalTo: colorCard.leadingAnchor, constant: 12),
            descriptionCard.bottomAnchor.constraint(equalTo: colorCard.bottomAnchor, constant: 12),
            buttonCheck.topAnchor.constraint(equalTo: colorCard.bottomAnchor, constant: 8),
            buttonCheck.trailingAnchor.constraint(equalTo: colorCard.trailingAnchor, constant: -12),
            dayCount.topAnchor.constraint(equalTo: colorCard.bottomAnchor, constant: 16),
            dayCount.leadingAnchor.constraint(equalTo: colorCard.leadingAnchor, constant: 12)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

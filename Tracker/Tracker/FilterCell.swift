//
//  FilterCell.swift
//  Tracker
//
//  Created by Margarita Pitinova on 20.08.2023.
//

import UIKit

final class FilterCell: UITableViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let doneImage: UIImageView = {
        let doneImage = UIImageView()
        doneImage.translatesAutoresizingMaskIntoConstraints = false
        return doneImage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .ypBackgroundDay
        clipsToBounds = true
        
        addSubview(titleLabel)
        addSubview(doneImage)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            doneImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            doneImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            doneImage.widthAnchor.constraint(equalToConstant: 24),
            doneImage.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with title: String) {
         titleLabel.text = title
    }
    
    func done(with image: UIImage) {
        doneImage.image = image
    }
}

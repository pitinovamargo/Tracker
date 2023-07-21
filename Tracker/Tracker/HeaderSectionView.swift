//
//  HeaderSectionView.swift
//  Tracker
//
//  Created by Margarita Pitinova on 19.07.2023.
//

import UIKit

final class HeaderSectionView: UICollectionReusableView {
    static let id = "header"
    let title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        title.text = "Утренняя рутина"
        title.textColor = .ypBlackDay
        title.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        addSubview(title)
        title.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHeader() {
        
    }
}

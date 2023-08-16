//
//  HabitColorCell.swift
//  Tracker
//
//  Created by Margarita Pitinova on 08.08.2023.
//

import UIKit

final class HabitColorCell: UICollectionViewCell {
    
    static var reuseId = "HabitColorCell"
    
    let colorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(colorView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        colorView.frame = CGRect(x: (contentView.bounds.width - 40) / 2,
                                 y: (contentView.bounds.height - 40) / 2,
                                 width: 40,
                                 height: 40)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

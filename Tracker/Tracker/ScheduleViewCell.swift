//
//  ScheduleViewCell.swift
//  Tracker
//
//  Created by Margarita Pitinova on 24.07.2023.
//

import UIKit

final class ScheduleViewCell: UITableViewCell {
    
    let dayOfWeek: UILabel = {
        let dayOfWeek = UILabel()
        dayOfWeek.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        dayOfWeek.translatesAutoresizingMaskIntoConstraints = false
        return dayOfWeek
    }()
    
    let switchDay: UISwitch = {
        let switchDay = UISwitch()
        switchDay.translatesAutoresizingMaskIntoConstraints = false
        return switchDay
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .ypBackgroundDay
        clipsToBounds = true
        
        addSubview(dayOfWeek)
        addSubview(switchDay)
        
        NSLayoutConstraint.activate([
            dayOfWeek.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dayOfWeek.centerYAnchor.constraint(equalTo: centerYAnchor),
            switchDay.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            switchDay.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

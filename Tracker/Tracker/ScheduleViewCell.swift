//
//  ScheduleViewCell.swift
//  Tracker
//
//  Created by Margarita Pitinova on 24.07.2023.
//

import UIKit

final class ScheduleViewCell: UITableViewCell {
    
    var selectedDay: Bool = false
    
    let dayOfWeek: UILabel = {
        let dayOfWeek = UILabel()
        dayOfWeek.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        dayOfWeek.translatesAutoresizingMaskIntoConstraints = false
        return dayOfWeek
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .ypBackgroundDay
        clipsToBounds = true
        
        contentView.addSubview(dayOfWeek)
        let switchDay = switchDay()
        
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
    
    func switchDay() -> UISwitch {
        let switchDay = UISwitch()
        addSubview(switchDay)
        switchDay.translatesAutoresizingMaskIntoConstraints = false
        switchDay.addTarget(self, action: #selector(switchTapped), for: .touchUpInside)
        return switchDay
    }
    
    @objc func switchTapped(_ sender: UISwitch) {
        self.selectedDay = sender.isOn
    }
}

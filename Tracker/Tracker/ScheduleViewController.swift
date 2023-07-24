//
//  ScheduleViewController.swift
//  Tracker
//
//  Created by Margarita Pitinova on 24.07.2023.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    let scheduleCellReuseIdentifier = "ScheduleTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .ypWhiteDay
        let tableView = scheduleTableView()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ScheduleViewCell.self, forCellReuseIdentifier: scheduleCellReuseIdentifier)
        tableView.layer.cornerRadius = 16
        tableView.separatorStyle = .none
        
        let header = header()
        let doneScheduleButton = doneScheduleButton()
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: view.topAnchor),
            view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            header.topAnchor.constraint(equalTo: view.topAnchor, constant: 26),
            header.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.heightAnchor.constraint(equalToConstant: 524),
            doneScheduleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            doneScheduleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            doneScheduleButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            doneScheduleButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func scheduleTableView() -> UITableView {
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }
    
    func header() -> UILabel {
        let header = UILabel()
        view.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        header.text = "Расписание"
        header.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        header.textColor = .ypBlackDay
        
        return header
    }
    
    func doneScheduleButton() -> UIButton {
        let doneScheduleButton = UIButton(type: .custom)
        view.addSubview(doneScheduleButton)
        doneScheduleButton.setTitleColor(.ypWhiteDay, for: .normal)
        doneScheduleButton.backgroundColor = .ypBlackDay
        doneScheduleButton.layer.cornerRadius = 16
        doneScheduleButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        doneScheduleButton.setTitle("Готово", for: .normal)
        doneScheduleButton.addTarget(self, action: #selector(doneScheduleButtonTapped), for: .touchUpInside)
        doneScheduleButton.translatesAutoresizingMaskIntoConstraints = false
        
        return doneScheduleButton
    }
    
    @objc private func doneScheduleButtonTapped() {
        
    }
}

extension ScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: scheduleCellReuseIdentifier, for: indexPath) as! ScheduleViewCell
        
        let dayOfWeek = WeekDay.allValues[indexPath.row]
        cell.dayOfWeek.text = dayOfWeek.rawValue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let separatorInset: CGFloat = 16
        let separatorWidth = tableView.bounds.width - separatorInset * 2
        let separatorHeight: CGFloat = 1.0
        let separatorX = separatorInset
        let separatorY = cell.frame.height - separatorHeight
        
        let separatorView = UIView(frame: CGRect(x: separatorX, y: separatorY, width: separatorWidth, height: separatorHeight))
        separatorView.backgroundColor = .ypGray
        
        cell.addSubview(separatorView)
    }
}

enum WeekDay: String {
    case понедельник = "Понедельник"
    case вторник = "Вторник"
    case среда = "Среда"
    case четверг = "Четверг"
    case пятница = "Пятница"
    case суббота = "Суббота"
    case воскресенье = "Воскресенье"
    
    static let allValues = [понедельник, вторник, среда, четверг, пятница, суббота, воскресенье]
}

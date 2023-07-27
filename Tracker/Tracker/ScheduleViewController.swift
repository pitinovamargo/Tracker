//
//  ScheduleViewController.swift
//  Tracker
//
//  Created by Margarita Pitinova on 24.07.2023.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    let scheduleCellReuseIdentifier = "ScheduleTableViewCell"
    
    let header: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.text = "Расписание"
        header.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        header.textColor = .ypBlackDay
        return header
    }()
    
    let scheduleTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .ypWhiteDay
        
        view.addSubview(header)
        view.addSubview(scheduleTableView)
        
        let doneScheduleButton = doneScheduleButton()

        scheduleTableView.delegate = self
        scheduleTableView.dataSource = self
        scheduleTableView.register(ScheduleViewCell.self, forCellReuseIdentifier: scheduleCellReuseIdentifier)
        scheduleTableView.layer.cornerRadius = 16
        scheduleTableView.separatorStyle = .none

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: view.topAnchor),
            view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            header.topAnchor.constraint(equalTo: view.topAnchor, constant: 26),
            header.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scheduleTableView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 30),
            scheduleTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scheduleTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scheduleTableView.heightAnchor.constraint(equalToConstant: 524),
            doneScheduleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            doneScheduleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            doneScheduleButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            doneScheduleButton.heightAnchor.constraint(equalToConstant: 60)
        ])
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
        
        let dayOfWeek = WeekDaySchedule.allValues[indexPath.row]
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        scheduleTableView.deselectRow(at: indexPath, animated: true)
    }
}

enum WeekDaySchedule: String {
    case monday = "Понедельник"
    case tuesday = "Вторник"
    case wednesday = "Среда"
    case thursday = "Четверг"
    case friday = "Пятница"
    case saturday = "Суббота"
    case sunday = "Воскресенье"
    
    static let allValues = [monday, tuesday, wednesday, thursday, friday, saturday, sunday]
}

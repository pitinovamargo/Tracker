//
//  AddTrackersViewController.swift
//  Tracker
//
//  Created by Margarita Pitinova on 21.07.2023.
//

import UIKit

final class AddTrackersViewController: UIViewController {
    
    var trackersViewController: TrackersViewController?
    
    let header: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.text = "Создание трекера"
        header.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        header.textColor = .ypBlackDay
        return header
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .ypWhiteDay
        
        view.addSubview(header)
        
        let habitButton = habitButton()
        let irregularButton = irregularButton()

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: view.topAnchor),
            view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            header.topAnchor.constraint(equalTo: view.topAnchor, constant: 26),
            header.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            habitButton.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 295),
            habitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            habitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            habitButton.heightAnchor.constraint(equalToConstant: 60),
            irregularButton.topAnchor.constraint(equalTo: habitButton.bottomAnchor, constant: 16),
            irregularButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            irregularButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            irregularButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func habitButton() -> UIButton {
        let habitButton = UIButton(type: .custom)
        view.addSubview(habitButton)
        habitButton.setTitle("Привычка", for: .normal)
        habitButton.setTitleColor(.ypWhiteDay, for: .normal)
        habitButton.backgroundColor = .ypBlackDay
        habitButton.layer.cornerRadius = 16
        habitButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        habitButton.addTarget(self, action: #selector(habitButtonTapped), for: .touchUpInside)
        habitButton.translatesAutoresizingMaskIntoConstraints = false
        return habitButton
    }
    
    func irregularButton() -> UIButton {
        let irregularButton = UIButton(type: .custom)
        view.addSubview(irregularButton)
        irregularButton.setTitleColor(.ypWhiteDay, for: .normal)
        irregularButton.backgroundColor = .ypBlackDay
        irregularButton.layer.cornerRadius = 16
        irregularButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        irregularButton.setTitle("Нерегулярное событие", for: .normal)
        irregularButton.addTarget(self, action: #selector(irregularButtonTapped), for: .touchUpInside)
        irregularButton.translatesAutoresizingMaskIntoConstraints = false
        return irregularButton
    }
    
    @objc private func habitButtonTapped() {
        let addHabit = CreateTrackerViewController()
        addHabit.trackersViewController = self.trackersViewController
        present(addHabit, animated: true)
    }
    
    @objc private func irregularButtonTapped() {
        let addEvent = IrregularEventViewController()
        present(addEvent, animated: true)
    }
    
}

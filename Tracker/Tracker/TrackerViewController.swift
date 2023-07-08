//
//  TrackerViewController.swift
//  Tracker
//
//  Created by Margarita Pitinova on 07.07.2023.
//

import UIKit

final class TrackerViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let addTracker = addTrackerButton()
        let header = header()
        let search = searchTreckers()
        let date = datePicker()
        let logo = emptyTrackersLogo()
        let text = emptyTrackersText()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: addTracker)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: date)
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            search.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 7),
            search.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            search.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.topAnchor.constraint(equalTo: search.bottomAnchor, constant: 220),
            logo.heightAnchor.constraint(equalToConstant: 80),
            logo.widthAnchor.constraint(equalToConstant: 80),
            text.centerXAnchor.constraint(equalTo: logo.centerXAnchor),
            text.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 8)
        ])
    }
    
    func addTrackerButton() -> UIButton {
        let addTracker = UIButton()
        view.addSubview(addTracker)
        addTracker.setImage(UIImage(named: "Add tracker"), for: .normal)
        addTracker.translatesAutoresizingMaskIntoConstraints = false
        //        addTracker.addTarget(self, action: #selector(<#T##@objc method#>), for: .touchUpInside)
        
        return addTracker
    }
    func header() -> UILabel {
        let header = UILabel()
        view.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        header.text = "Трекеры"
        header.textColor = .ypBlackDay
        header.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        
        return header
    }
    func searchTreckers() -> UISearchTextField {
        let search = UISearchTextField()
        view.addSubview(search)
        search.translatesAutoresizingMaskIntoConstraints = false
        search.placeholder = "Поиск"
        
        return search
    }
    func datePicker() -> UIDatePicker {
        let date = UIDatePicker()
        view.addSubview(date)
        date.translatesAutoresizingMaskIntoConstraints = false
        date.preferredDatePickerStyle = .compact
        date.datePickerMode = .date
        
        return date
    }
    func emptyTrackersLogo() -> UIImageView {
        let logo = UIImageView()
        view.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "Empty trackers")
        
        return logo
    }
    func emptyTrackersText() -> UILabel {
        let text = UILabel()
        view.addSubview(text)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Что будем отслеживать?"
        text.textColor = .ypBlackDay
        text.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        
        return text
    }
}

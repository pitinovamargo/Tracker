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
        
        NSLayoutConstraint.activate([
            addTracker.heightAnchor.constraint(equalToConstant: 42),
            addTracker.widthAnchor.constraint(equalToConstant: 42),
            addTracker.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
            addTracker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 6),
            header.topAnchor.constraint(equalTo: addTracker.bottomAnchor, constant: 0),
            header.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            search.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 7),
            search.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            search.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16)

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
}

//
//  TrackerViewController.swift
//  Tracker
//
//  Created by Margarita Pitinova on 07.07.2023.
//

import UIKit

final class TrackersViewController: UIViewController {
    
    private let trackersCards = [
        "а", "б", "в", "г", "д", "е", "ё", "ж", "з", "и", "й", "к",
        "л", "м", "н", "о", "п", "р", "с", "т", "у", "ф", "х", "ц",
        "ч", "ш" , "щ", "ъ", "ы", "ь", "э", "ю", "я"
    ]
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    
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
        
        
        
       
        let collectionView = collectionView // создаем коллекцию
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
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
            text.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 8),
            
            collectionView.topAnchor.constraint(equalTo: search.bottomAnchor, constant: 24),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TrackersCollectionCell.self, forCellWithReuseIdentifier: "cell") // регистрируем класс для обращения к ячейке коллекции
        
        collectionView.allowsMultipleSelection = false
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

extension TrackersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trackersCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? TrackersCollectionCell else {
            fatalError("Unable to dequeue LetterCollectionViewCell")
        }

        cell.titleLabel.text = trackersCards[indexPath.row]
        return cell
    }
}

extension TrackersViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.bounds.width / 2, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension TrackersViewController: UICollectionViewDelegate {

}



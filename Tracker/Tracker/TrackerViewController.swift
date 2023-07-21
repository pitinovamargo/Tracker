//
//  TrackerViewController.swift
//  Tracker
//
//  Created by Margarita Pitinova on 07.07.2023.
//

import UIKit

final class TrackersViewController: UIViewController {
    
    private var trackers: [Tracker] = []
    private var categories: [TrackerCategory] = []
    private var completedTrackers: [TrackerRecord] = []
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let colors: [UIColor] = [
        .ypColorSelection1, .ypColorSelection2, .ypColorSelection3,
        .ypColorSelection4, .ypColorSelection5, .ypColorSelection6,
        .ypColorSelection7, .ypColorSelection8, .ypColorSelection9,
        .ypColorSelection10, .ypColorSelection11, .ypColorSelection12,
        .ypColorSelection13, .ypColorSelection14, .ypColorSelection15,
        .ypColorSelection16, .ypColorSelection17, .ypColorSelection18
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let tracker = Tracker(name: "some", color: .ypColorSelection1, emoji: "😜", schedule: 8)
        categories.append(TrackerCategory(header: "Утренняя рутина", trackers: [tracker]))
        
        let addTracker = addTrackerButton()
        let header = header()
        let search = searchTreckers()
        let date = datePicker()
        let logo = emptyTrackersLogo()
        let text = emptyTrackersText()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: addTracker)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: date)
        
        let collectionView = collectionView
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
        collectionView.register(TrackersCollectionCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(HeaderSectionView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderSectionView.id)
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
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? TrackersCollectionCell else {
            return UICollectionViewCell()
        }
        cell.prepareForReuse()
        
        cell.setupCell(daysAmount: "5 дней")
        cell.trackerDescription.text = "Поливать растения"
        cell.trackerEmoji.text = "😜"
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView:UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderSectionView.id, for: indexPath) as? HeaderSectionView else {
            return UICollectionReusableView()
        }
        return header
    }
}

extension TrackersViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 2 - 5, height: (collectionView.bounds.width / 2 - 5) * 0.88)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 47)
    }
}

struct Tracker {
    //    let id: UUID
    let name: String
    let color: UIColor
    let emoji: String
    let schedule: Int
}

struct TrackerCategory {
    let header: String
    let trackers: [Tracker]
}

struct TrackerRecord {
    let id: UUID
    let date: Int
}

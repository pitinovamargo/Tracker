//
//  TrackersCollectionController.swift
//  Tracker
//
//  Created by Margarita Pitinova on 10.07.2023.
//

//import UIKit
//
//final class TrackersCollectionController: UIViewController {
//    private let letters = [
//        "а", "б", "в", "г", "д", "е", "ё", "ж", "з", "и", "й", "к",
//        "л", "м", "н", "о", "п", "р", "с", "т", "у", "ф", "х", "ц",
//        "ч", "ш" , "щ", "ъ", "ы", "ь", "э", "ю", "я"
//    ]
//    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let collectionView = collectionView // создаем коллекцию
//        view.addSubview(collectionView)
//        
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([ // настраиваем констрейнты коллекции
//            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//                                    ])
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        //        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell") // инициализируем ячейку коллекции по id из сториборда
//        collectionView.register(TrackersCollectionCell.self, forCellWithReuseIdentifier: "cell") // регистрируем класс для обращения к ячейке коллекции
//        
//        collectionView.allowsMultipleSelection = false
//    }
//}

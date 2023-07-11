//
//  TrackersCollectionController.swift
//  Tracker
//
//  Created by Margarita Pitinova on 10.07.2023.
//

//import UIKit
//
//final class TrackersCollection: NSObject, UICollectionViewDataSource {
//    private let colors: [UIColor] = [
//        .black, .blue, .brown,
//        .cyan, .green, .orange,
//        .red, .purple, .yellow
//    ]
//    
//    let count: Int
//    
//    init(count: Int) {
//        self.count = count
//    }
//    
//    func viewDidLoad() {
//        
//        // Размеры для коллекции:
//        let size = CGRect(origin: CGPoint(x: 0, y: 0),
//                          size: CGSize(width: 400, height: 600))
//        // Указываем, какой Layout хотим использовать:
//        let layout = UICollectionViewFlowLayout()
//        
//        let helper = TrackersCollection(count: 31)
//        let collection = UICollectionView(frame: size,
//                                          collectionViewLayout: layout)
//        // Регистрируем ячейку в коллекции.
//        // Регистрируя ячейку, мы сообщаем коллекции, какими типами ячеек она может распоряжаться.
//        // При попытке создать ячейку с незарегистрированным идентификатором коллекция выдаст ошибку.
//        collection.register(TrackersCollectionCell.self, forCellWithReuseIdentifier: TrackersCollectionCell.identifier)
//        collection.backgroundColor = .lightGray
//        collection.dataSource = helper
//        
//        collection.reloadData()
//    }
//    
//    // MARK: - UICollectionViewDataSource
//    
//    func collectionView(_ collectionView: UICollectionView,
//                        numberOfItemsInSection section: Int) -> Int {
//        return count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView,
//                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrackersCollectionCell.identifier,
//                                                            
//                                                            for: indexPath) as? TrackersCollectionCell else {
//            return UICollectionViewCell()
//        }
//        
//        cell.prepareForReuse()
//        
//        // Произвольно выбираем цвет для фона ячейки:
//        cell.contentView.backgroundColor = colors[Int.random(in: 0..<colors.count)]
//        
//        return cell
//    }
//    
//    // MARK: - UICollectionViewDelegateFlowLayout
//    
//}

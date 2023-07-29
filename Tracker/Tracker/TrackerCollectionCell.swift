//
//  TrackerCollectionCell.swift
//  Tracker
//
//  Created by Margarita Pitinova on 10.07.2023.
//

import UIKit

final class TrackerCollectionCell: UICollectionViewCell {
    
    static var reuseId = "cell"
    private let colors: [UIColor] = [
        .ypColorSelection1, .ypColorSelection2, .ypColorSelection3,
        .ypColorSelection4, .ypColorSelection5, .ypColorSelection6,
        .ypColorSelection7, .ypColorSelection8, .ypColorSelection9,
        .ypColorSelection10, .ypColorSelection11, .ypColorSelection12,
        .ypColorSelection13, .ypColorSelection14, .ypColorSelection15,
        .ypColorSelection16, .ypColorSelection17, .ypColorSelection18
    ]
    
    lazy var trackersDaysAmount: UILabel = {
        let trackersDaysAmount = UILabel()
        contentView.addSubview(trackersDaysAmount)
        trackersDaysAmount.frame = CGRect(x: 120, y: 106, width: 101, height: 18)
        trackersDaysAmount.translatesAutoresizingMaskIntoConstraints = false
        trackersDaysAmount.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        trackersDaysAmount.textColor = .ypBlackDay
        return trackersDaysAmount
    }()
    lazy var trackerDescription: UILabel = {
        let trackerDescription = UILabel()
        contentView.addSubview(trackerDescription)
        trackerDescription.frame = CGRect(x: 120, y: 106, width: 143, height: 34)
        trackerDescription.translatesAutoresizingMaskIntoConstraints = false
        trackerDescription.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        trackerDescription.textColor = .ypWhiteDay
        trackerDescription.numberOfLines = 0
        trackerDescription.lineBreakMode = .byWordWrapping
        trackerDescription.preferredMaxLayoutWidth = 143
        return trackerDescription
    }()
    lazy var trackerCard: UIView = {
        let trackerCard = UIView()
        contentView.addSubview(trackerCard)
        trackerCard.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.width * 0.55)
        trackerCard.backgroundColor = colors[Int.random(in: 0..<self.colors.count)]
        trackerCard.layer.cornerRadius = 16
        return trackerCard
    }()
    lazy var completedTrackerButton: UIButton = {
        let completedTrackerButton = UIButton(type: .custom)
        contentView.addSubview(completedTrackerButton)
        completedTrackerButton.frame = CGRect(x: 100, y: 100, width: 34, height: 34)
        completedTrackerButton.translatesAutoresizingMaskIntoConstraints = false
        completedTrackerButton.setImage(UIImage(named: "Plus")?.withTintColor(trackerCard.backgroundColor ?? .ypWhiteDay), for: .normal)
        completedTrackerButton.addTarget(self, action: #selector(completedTracker), for: .touchUpInside)
        return completedTrackerButton
    }()

    lazy var emojiBackground: UIView = {
        let emojiBackground = UIView()
        contentView.addSubview(emojiBackground)
        emojiBackground.frame = CGRect(x: 12, y: 12, width: 24, height: 24)
        emojiBackground.backgroundColor = .ypWhiteDay
        emojiBackground.layer.cornerRadius = emojiBackground.frame.width / 2
        emojiBackground.layer.opacity = 0.3
        return emojiBackground
    }()
    lazy var trackerEmoji: UILabel = {
        let trackerEmoji = UILabel()
        contentView.addSubview(trackerEmoji)
        trackerEmoji.frame = CGRect(x: 0, y: 0, width: 18, height: 18)
        trackerEmoji.translatesAutoresizingMaskIntoConstraints = false
        trackerEmoji.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return trackerEmoji
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            trackersDaysAmount.topAnchor.constraint(equalTo: trackerCard.bottomAnchor, constant: 16),
            trackersDaysAmount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            trackerDescription.leadingAnchor.constraint(equalTo: trackerCard.leadingAnchor, constant: 12),
            trackerDescription.bottomAnchor.constraint(equalTo: trackerCard.bottomAnchor, constant: -12),
            completedTrackerButton.centerYAnchor.constraint(equalTo: trackersDaysAmount.centerYAnchor),
            completedTrackerButton.trailingAnchor.constraint(equalTo: trackerCard.trailingAnchor, constant: -12),
            trackerEmoji.centerXAnchor.constraint(equalTo: emojiBackground.centerXAnchor),
            trackerEmoji.centerYAnchor.constraint(equalTo: emojiBackground.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func completedTracker() {
        completedTrackerButton.setImage(UIImage(named: "Tracker Done")?.withTintColor(trackerCard.backgroundColor ?? .ypWhiteDay), for: .normal)
    }
}

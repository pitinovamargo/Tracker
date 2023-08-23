//
//  PreviewViewController.swift
//  Tracker
//
//  Created by Margarita Pitinova on 23.08.2023.
//

import UIKit

final class PreviewViewController: UIViewController {
    private var previewSize: CGSize? {
        didSet {
            if let size = previewSize {
                self.preferredContentSize = size
            }
        }
    }

    private let trackerDescription: UILabel = {
        let trackerDescription = UILabel()
        trackerDescription.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        trackerDescription.textColor = .white
        trackerDescription.translatesAutoresizingMaskIntoConstraints = false
        return trackerDescription
    }()
    
    private lazy var trackerCard: UIView = {
        let trackerCard = UIView()
        trackerCard.translatesAutoresizingMaskIntoConstraints = false
        return trackerCard
    }()
    
    private let emojiBackground: UIView = {
        let emojiBackground = UIView()
        emojiBackground.frame = CGRect(x: 12, y: 12, width: 24, height: 24)
        emojiBackground.backgroundColor = .white
        emojiBackground.layer.cornerRadius = emojiBackground.frame.width / 2
        emojiBackground.layer.opacity = 0.3
        emojiBackground.translatesAutoresizingMaskIntoConstraints = false
        return emojiBackground
    }()
    
    private let trackerEmoji: UILabel = {
        let trackerEmoji = UILabel()
        trackerEmoji.translatesAutoresizingMaskIntoConstraints = false
        return trackerEmoji
    }()
    
    let pinnedTracker: UIImageView = {
        let pinnedTracker = UIImageView()
        pinnedTracker.image = UIImage(named: "Pin")
        pinnedTracker.translatesAutoresizingMaskIntoConstraints = false
        return pinnedTracker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            trackerCard.topAnchor.constraint(equalTo: view.topAnchor),
            trackerCard.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trackerCard.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            trackerCard.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            emojiBackground.topAnchor.constraint(equalTo: trackerCard.topAnchor, constant: 12),
            emojiBackground.leadingAnchor.constraint(equalTo: trackerCard.leadingAnchor, constant: 12),
            emojiBackground.widthAnchor.constraint(equalToConstant: 24),
            emojiBackground.heightAnchor.constraint(equalTo: emojiBackground.widthAnchor),
            
            trackerEmoji.centerXAnchor.constraint(equalTo: emojiBackground.centerXAnchor),
            trackerEmoji.centerYAnchor.constraint(equalTo: emojiBackground.centerYAnchor),
            
            trackerDescription.leadingAnchor.constraint(equalTo: trackerCard.leadingAnchor, constant: 12),
            trackerDescription.bottomAnchor.constraint(equalTo: trackerCard.bottomAnchor, constant: -12),
            pinnedTracker.centerYAnchor.constraint(equalTo: trackerEmoji.centerYAnchor),
            pinnedTracker.trailingAnchor.constraint(equalTo: trackerCard.trailingAnchor, constant: -12)
        ])
    }
     
    func configureView(sizeForPreview: CGSize, tracker: Tracker) {
        previewSize = sizeForPreview
        trackerCard.backgroundColor = tracker.color
        trackerEmoji.text = tracker.emoji
        trackerDescription.text = tracker.title
        
        self.pinnedTracker.isHidden = tracker.pinned ? false : true
    }
    
    private func addSubviews() {
        view.addSubview(trackerCard)
        view.addSubview(emojiBackground)
        view.addSubview(trackerEmoji)
        view.addSubview(trackerDescription)
        view.addSubview(pinnedTracker)
    }
}

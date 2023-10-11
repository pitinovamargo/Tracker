//
//  TabBarController.swift
//  Tracker
//
//  Created by Margarita Pitinova on 07.07.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                
        let trackersVC = TrackersViewController()
        let trackersViewController = UINavigationController(rootViewController: trackersVC)
        trackersViewController.tabBarItem = UITabBarItem(
            title: NSLocalizedString("app.title", comment: ""),
            image: UIImage(named: "Trackers"),
            selectedImage: nil
        )
        
        let statisticViewController = StatisticViewController()
        statisticViewController.trackersViewController = trackersVC
        statisticViewController.tabBarItem = UITabBarItem(
            title: NSLocalizedString("statistic.title", comment: ""),
            image: UIImage(named: "Stats"),
            selectedImage: nil
        )
        
        self.viewControllers = [trackersViewController, statisticViewController]
        
        let separatorImage = UIImage()

        self.tabBar.shadowImage = separatorImage
        self.tabBar.backgroundImage = separatorImage
        self.tabBar.layer.borderWidth = 0.50
        self.tabBar.clipsToBounds = true
    }
}

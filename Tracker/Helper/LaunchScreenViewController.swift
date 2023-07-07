//
//  LaunchScreenViewController.swift
//  Tracker
//
//  Created by Margarita Pitinova on 05.07.2023.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLaunchScreen()
    }
    
    func setupLaunchScreen() {
        let launchScreenView = UIView(frame: self.view.bounds)
        launchScreenView.backgroundColor = UIColor.ypBlue
        
        let logoImageView = UIImageView(image: UIImage(named: "Start logo"))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        launchScreenView.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: launchScreenView.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: launchScreenView.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 91),
            logoImageView.heightAnchor.constraint(equalToConstant: 94)
        ])
        
        self.view.addSubview(launchScreenView)
    }
}

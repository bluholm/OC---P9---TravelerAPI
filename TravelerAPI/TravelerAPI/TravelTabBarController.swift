//
//  TravelTabBarController.swift
//
//
//  Created by Marc-Antoine BAR on 2022-10-27.
//

import UIKit

final class TravelTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemGray6
        self.tabBar.tintColor = .label
        
        self.setupViewControllers()
    }
    
    private func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
    
    private func setupViewControllers() {
        self.viewControllers = [
            createNavController(for: WeatherViewController(),
                                title: NSLocalizedString("Weather", comment: ""),
                                image: UIImage(systemName: "cloud.snow")!),
            createNavController(for: TranslateViewController(),
                                title: NSLocalizedString("Translate", comment: "welcome to the beautiful app!"),
                                image: UIImage(systemName: "exclamationmark.bubble.fill")!),
            createNavController(for: CurrencyViewController(),
                                title: NSLocalizedString("Exchange", comment: ""),
                                image: UIImage(systemName: "dollarsign.square")!)
        ]
    }
    
}

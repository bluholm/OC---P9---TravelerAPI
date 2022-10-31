//
//  TabBar.swift
//  TravelerAPI
//
//  Created by Marc-Antoine BAR on 2022-10-27.
//

import UIKit

class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemGray6
        tabBar.tintColor = .label
        
        setupVCs()
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: WeatherViewController(),
                                title: NSLocalizedString("Weather", comment: ""),
                                image: UIImage(systemName: "cloud.snow")!),
            createNavController(for: TranslateViewController(),
                                title: NSLocalizedString("Translate", comment: "welcome to the beautiful app!"),
                                image: UIImage(systemName: "exclamationmark.bubble.fill")!),
            createNavController(for: CurrencyViewController(),
                                title: NSLocalizedString("Currency  converter", comment: ""),
                                image: UIImage(systemName: "dollarsign.square")!)
        ]
    }
    
}

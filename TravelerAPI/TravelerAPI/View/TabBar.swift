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
                                title: NSLocalizedString("Search", comment: ""),
                                image: UIImage(systemName: "magnifyingglass")!),
            createNavController(for: ViewController(),
                                title: NSLocalizedString("Home", comment: "welcome to the beautiful app!"),
                                image: UIImage(systemName: "house")!),
            createNavController(for: ViewController(),
                                title: NSLocalizedString("Profile", comment: ""),
                                image: UIImage(systemName: "person")!)
        ]
    }
    
}

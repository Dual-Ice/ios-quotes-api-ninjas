//
//  MainTabBarController.swift
//  ios-quotes-api-ninjas
//
//  Created by  Maksim Stogniy on 22.06.2024.
//
import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let quotesViewController = UINavigationController(rootViewController: MainViewController())
        quotesViewController.tabBarItem = UITabBarItem(title: "Quotes", image: UIImage(systemName: "quote.bubble"), tag: 0)
        
        let jokesViewController = UINavigationController(rootViewController: JokesViewController())
        jokesViewController.tabBarItem = UITabBarItem(title: "Jokes", image: UIImage(systemName: "face.smiling"), tag: 1)
        
        let chuckNorrisViewController = UINavigationController(rootViewController: ChuckNorrisViewController())
        chuckNorrisViewController.tabBarItem = UITabBarItem(title: "ChuckNorris", image: UIImage(systemName: "star"), tag: 2)
        
        viewControllers = [quotesViewController, jokesViewController, chuckNorrisViewController]
    }
}


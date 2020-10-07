//
//  MainTabBar.swift
//  COOL
//
//  Created by Yura on 10/5/20.
//

import UIKit

class MainTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let home = Home()
        let history = History()
        let stats = Stats()
        let community = Community()
        let profile = Profile()
        let discover = Discover()
        
        home.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), selectedImage: UIImage(systemName: "house.fill"))
        history.tabBarItem = UITabBarItem(title: "History", image: UIImage(systemName: "clock.fill"), selectedImage: UIImage(systemName: "clock.fill"))
        stats.tabBarItem = UITabBarItem(title: "Stats", image: UIImage(systemName: "chart.bar.fill"), selectedImage: UIImage(systemName: "chart.bar.fill"))
        community.tabBarItem = UITabBarItem(title: "Community", image: UIImage(systemName: "person.3.fill"), selectedImage: UIImage(systemName: "person.3.fill"))
        profile.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle.fill"), selectedImage: UIImage(systemName: "person.crop.circle.fill"))
        discover.tabBarItem = UITabBarItem(title: "Discover", image: UIImage(systemName: "magnifyingglass.circle.fill"), selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"))
        
        viewControllers = [home, history, stats, community, profile, discover]
    }
    
    /// https://stackoverflow.com/questions/59509915/override-traitcollection-in-ios-13
    override var traitCollection: UITraitCollection {
        let realTraits = super.traitCollection
        let lieTrait = UITraitCollection.init(horizontalSizeClass: .regular)
        
        return UITraitCollection(traitsFrom: [realTraits, lieTrait])
    }
}

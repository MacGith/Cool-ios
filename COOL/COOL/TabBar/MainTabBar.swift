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
        //let homeVC = Home()
        let history = UINavigationController(rootViewController: History(nibName: "History", bundle: nil))
        let stats = Stats()
        let community = Community()
        let profile = UINavigationController(rootViewController: Profile(nibName: "Profile", bundle: nil))
        let discover = Discover()
        
        //let homeVC =  Home(nibName: "Home", bundle: nil)

        let homeVC = UINavigationController(rootViewController: Home(nibName: "Home", bundle: nil))
        //homeVC.navigationBar = NavigationBar()
              
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "Home"), selectedImage: UIImage(systemName: "HomeSelected"))
        history.tabBarItem = UITabBarItem(title: "History", image: UIImage(named: "History"), selectedImage: UIImage(systemName: "HistorySelected"))
        stats.tabBarItem = UITabBarItem(title: "Stats", image: UIImage(named: "Stats"), selectedImage: UIImage(systemName: "StatsSelected"))
        community.tabBarItem = UITabBarItem(title: "Community", image: UIImage(named: "Community"), selectedImage: UIImage(named: "CommunitySelected"))
        profile.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "Profile"), selectedImage: UIImage(named: "ProfileSelected"))
        discover.tabBarItem = UITabBarItem(title: "Discover", image: UIImage(named: "Discover"), selectedImage: UIImage(systemName: "DiscoverSelected"))
        
        viewControllers = [homeVC, history, stats, community, profile, discover]
    }
    
    /// https://stackoverflow.com/questions/59509915/override-traitcollection-in-ios-13
    override var traitCollection: UITraitCollection {
        let realTraits = super.traitCollection
        let lieTrait = UITraitCollection.init(horizontalSizeClass: .regular)
        
        return UITraitCollection(traitsFrom: [realTraits, lieTrait])
    }
}

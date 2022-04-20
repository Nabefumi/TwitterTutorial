//
//  MainTabontroller.swift
//  TwitterTutorial
//
//  Created by Takafumi Watanabe on 2022-04-13.
//

import UIKit

class MainTabontroller: UITabBarController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
                
        configureViewControllers()
        uiTabBarSetting()
//        uiNavBarSetting()
        
    }
    
    // MARK: - Helpers
    
    func configureViewControllers() {
        
        let feed = FeedController()
        _ = templateNavigationController(image: UIImage(named: "home_unselected"), rootViewController: feed)
                
        let explore = ExploreController()
        _ = templateNavigationController(image: UIImage(named: "search_unselected"), rootViewController: explore)
        
        let notifications = NotificationsController()
        _ = templateNavigationController(image: UIImage(named: "like_filled"), rootViewController: notifications)

        let conversations = ConversationsController()
        _ = templateNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1"), rootViewController: conversations)
        
        viewControllers = [feed, explore, notifications, conversations]
        
    }
    
    func templateNavigationController(image: UIImage?, rootViewController: UIViewController) ->
    UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        return nav
    }
    
    func uiTabBarSetting() {
        if #available(iOS 15.0, *){
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .red
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = appearance
        }
    }
    
//    func uiTabBarSetting() {
//        if #available(iOS 15.0, *) {
//            let appearance = UINavigationBarAppearance()
//            appearance.configureWithOpaqueBackground()
//            // NavigationBarの背景色の設定
//            appearance.backgroundColor = UIColor.systemGreen
//            // NavigationBarのタイトルの文字色の設定
//            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//            self.navigationController?.navigationBar.standardAppearance = appearance
//            self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
//        }
//    }

}

//
//  MainTabontroller.swift
//  TwitterTutorial
//
//  Created by Takafumi Watanabe on 2022-04-13.
//

import UIKit

class MainTabontroller: UITabBarController {
    
    // MARK: - Properties
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
                
        configureViewControllers()
        uiTabBarSetting()
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc func actionButtonTapped() {
        print(123)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,
                            paddingBottom: 64, paddingRight: 26, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56 / 2
    }
    
    func configureViewControllers() {
            
        let feed = FeedController()
        let feedNavigationController = templateNavigationController(image: UIImage(named: "home_unselected"), rootViewController: feed)

        let explore = ExploreController()
        let exploreNavigationController = templateNavigationController(image: UIImage(named: "search_unselected"), rootViewController: explore)

        let notifications = NotificationsController()
        let notificationNavigationController = templateNavigationController(image: UIImage(named: "like_filled"), rootViewController: notifications)

        let conversations = ConversationsController()
        let conversationNavigationController = templateNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1"), rootViewController: conversations)

        viewControllers = [feedNavigationController, exploreNavigationController, notificationNavigationController, conversationNavigationController]
            
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

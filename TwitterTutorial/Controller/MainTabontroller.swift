//
//  MainTabontroller.swift
//  TwitterTutorial
//
//  Created by Takafumi Watanabe on 2022-04-13.
//

import UIKit
import Firebase

class MainTabontroller: UITabBarController {
    
    // MARK: - Properties
    
    var user: User? {
        didSet {
            guard let nav = viewControllers?[0] as? UINavigationController else { return }
            guard let feed = nav.viewControllers.first as? FeedController else { return }
            
            feed.user = user
        }
    }
    
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
                
//        logUserOut()
        view.backgroundColor = .twitterBlue
        authenticateUserAndConfigureUI()

    }
    
    // MARK: - API
    
//    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
//        COLLECTION_USERS.document(uid).getDocument { (snapshot, error) in
//            guard let dictionary = snapshot?.data() else { return }
//            let user = User(dictionary: dictionary)
//            completion(user)
//        }
//    }
    
    func fetchUser() {
        UserService.shared.fetchUser { user in
            self.user = user
        }
    }
    
    func authenticateUserAndConfigureUI() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        } else {
            
            configureViewControllers()
            uiTabBarSetting()
            configureUI()
            fetchUser()
        }
    }
    
    func logUserOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
                print("DEBUG: Failed sign out with error \(error.localizedDescription)")
        }
    }

    
    // MARK: - Selectors
    
    @objc func actionButtonTapped() {
        p
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

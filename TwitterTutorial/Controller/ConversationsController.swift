//
//  ConversationsController.swift
//  TwitterTutorial
//
//  Created by Takafumi Watanabe on 2022-04-13.
//

import UIKit

class ConversationsController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title  = "Messages"
    }
}

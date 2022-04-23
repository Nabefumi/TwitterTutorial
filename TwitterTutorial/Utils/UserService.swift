//
//  UserService.swift
//  TwitterTutorial
//
//  Created by Takafumi Watanabe on 2022-04-22.
//

import Firebase

struct UserService {
    static let shared = UserService()
        
    func fetchUser(completion: @escaping(User) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        COLLECTION_USERS.document(uid).getDocument { (snapshot, error) in
            guard let dictionary = snapshot?.data() else { return }
            
            let user = User(uid: uid, dictionary: dictionary)
            completion(user)
            
        }
    }
}


//
//  Service.swift
//  UberClone
//
//  Created by 罗帅卿 on 4/18/21.
//

import Firebase

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")

struct Service {
    static let shared = Service()
    let currentUid = Auth.auth().currentUser?.uid
    
    func fetchUserData(completion: @escaping(User) -> Void) {
        guard let currentUid = self.currentUid else { return }
        
        REF_USERS.child(currentUid).observeSingleEvent(of: .value) { (snapshot) in
            guard let dict = snapshot.value as? [String: Any] else { return }
            
            let user = User(dict: dict)
            completion(user)
        }
    }
}

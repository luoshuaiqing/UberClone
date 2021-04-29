//
//  User.swift
//  UberClone
//
//  Created by 罗帅卿 on 4/18/21.
//

import CoreLocation

struct User {
    let uid: String
    let fullName: String
    let email: String
    let accountType: Int
    var location: CLLocation?
    
    init(uid: String, dict: [String: Any]) {
        self.uid = uid
        self.fullName = dict["fullName"] as? String ?? ""
        self.email = dict["email"] as? String ?? ""
        self.accountType = dict["accountType"] as? Int ?? 0
    }
}

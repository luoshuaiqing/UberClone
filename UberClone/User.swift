//
//  User.swift
//  UberClone
//
//  Created by 罗帅卿 on 4/18/21.
//

struct User {
    let fullName: String
    let email: String
    let accountType: Int
    
    init(dict: [String: Any]) {
        self.fullName = dict["fullName"] as? String ?? ""
        self.email = dict["email"] as? String ?? ""
        self.accountType = dict["accountType"] as? Int ?? 0
    }
}

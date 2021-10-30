//
//  ProfileService.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/30.
//

import SwiftUI
import Firebase

class ProfileService : ObservableObject {
    
    @Published var userInfo = User(fullname: "", email: "")
    @AppStorage("current_status") var status = false
    
    let db = FirestoreService.db
    let uid = Auth.auth().currentUser!.uid
    
    init() {
        fetchUser()
    }
    
    //Function to get signed in user info
    func fetchUser() {
        
        db.collection("users").document(uid).getDocument { (doc, error) in
            guard let user = doc else{return}
            
            let fullname = user.data()?["fullname"] as! String
            let email = user.data()?["email"] as! String
            
            DispatchQueue.main.async {
                self.userInfo = User(fullname: fullname, email: email)
            }
        }
    }
}

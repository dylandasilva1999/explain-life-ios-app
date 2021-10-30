//
//  AuthService.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/30.
//

import Foundation
import Firebase
import FirebaseAuth

class AuthService {
    
    //Instance of Firebase Auth
    static var auth = Auth.auth()
    
    //SignUp function for signing up user
    static func signUp(fullname: String, email: String, password: String, onSuccess: @escaping (_ user: String) -> Void, onError: @escaping (_ errorMessage: String) -> Void) {
        
        //Create a new user with email and password
        auth.createUser(withEmail: email, password: password) {
            (authData, error) in
            
            //Error handling
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            
            guard let userId = authData?.user.uid else {return}
            
            FirestoreService.addNewUser(uid: userId, fullname: fullname, email: email)
            onSuccess(userId)
        }
    }
}

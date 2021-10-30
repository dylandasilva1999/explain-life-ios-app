//
//  FirestoreService.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/30.
//

import Foundation
import Firebase
import FirebaseFirestore

class FirestoreService {
    
    //Create an instance of Firestore
    static var db = Firestore.firestore()
    
    //Get the user information based on UID
    static func getUserId(userId: String) -> DocumentReference {
        return db.collection("users").document(userId)
    }
    
    //Function to add new user to the Firestore database from SignUp function
    static func addNewUser(uid: String, fullname: String, email: String) {
        db.collection("users").document(uid).setData([
            "fullname" : fullname,
            "email" : email
        ]) { error in
            
            //Error handling
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
}

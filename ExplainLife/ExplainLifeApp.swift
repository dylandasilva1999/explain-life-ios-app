//
//  ExplainLifeApp.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/09/28.
//

import SwiftUI
import Firebase

//Main App Struct
@main
struct ExplainLifeApp: App {
    
    //Create an instance of AppDelegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @EnvironmentObject var swiftUISpeech:SwiftUISpeech
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(SwiftUISpeech())
        }
    }
}

//App Delegate Class
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        //Print Firebase loading verification
        print("Firebase loading...")
        
        //Initialise Firebase
        FirebaseApp.configure()
        
        //Return true
        return true
    }
}

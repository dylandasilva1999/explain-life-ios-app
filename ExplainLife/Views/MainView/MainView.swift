//
//  MainView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/04.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea()
            VStack {
                Text("Signed in successfully")
                    .font(Font.custom("Aeonik-Bold", size: 25))
                    .foregroundColor(Color("Navy Blue"))
                
                //Sign In Button
                Button(action: {
                    try! Auth.auth().signOut()
                    UserDefaults.standard.set(false, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                }) {
                    Text("sign out")
                        .font(Font.custom("Aeonik-Regular", size: 25))
                        .foregroundColor(Color("Navy Blue"))
                        .padding(.vertical, 25)
                        .frame(width: UIScreen.main.bounds.width - 80)
                }
                .background(Color("Pastel Green"))
                .cornerRadius(20)
                .padding(.top, 10)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

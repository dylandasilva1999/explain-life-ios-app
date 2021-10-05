//
//  ProfileView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/04.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 40) {
            VStack(spacing: 20) {
                //Page title
                HStack {
                    Image("profile")
                        .renderingMode(.template)
                        .font(.title)
                        .foregroundColor(Color("Pastel Blue"))
                        .padding(.top, 5)
                        .padding(.trailing, 5)
                    //Speak page text
                    Text("Profile")
                        .font(Font.custom("Aeonik-Bold", size: 32))
                        .foregroundColor(Color("Navy Blue"))
                    
                    Spacer()
                }
                //Custom Groupbox
                GroupBox(
                    content: { Text("edit your username or email address by clicking on the pen icon next to each field.")
                            .font(Font.custom("Aeonik-Regular", size: 18))
                            .foregroundColor(Color("Navy Blue"))
                })
                .cornerRadius(20)
                .groupBoxStyle(TransparentGroupBoxProfile())
            }
            .frame(width: UIScreen.main.bounds.width - 80)
            
            Spacer()
            
            //Say out loud button
            Button(action: {
                try! Auth.auth().signOut()
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }) {
                Text("sign out of account")
                    .font(Font.custom("Aeonik-Regular", size: 25))
                    .foregroundColor(Color("Navy Blue"))
                    .padding(.vertical, 25)
            }
            .frame(width: UIScreen.main.bounds.width - 80)
            .background(Color("Pastel Blue"))
            .cornerRadius(20)
        }
        .frame(height: UIScreen.main.bounds.height - 200)
    }
}

//Transparent Custom GroupBoxStyle
struct TransparentGroupBoxProfile: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .frame(maxWidth: .infinity)
            .padding(30)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color("Muted Pastel Blue")))
            .overlay(configuration.label.padding(.leading, 0), alignment: .topLeading)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

//
//  ProfileView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/04.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    
    //StateObject var to have an instance of ProfileService and
    //access to the swift file
    @StateObject var profileService = ProfileService()
    @State var color = Color("Navy Blue")
    
    //Variable initialisations in which the user details are saved
    @State var fullname : String = ""
    @State var email : String = ""
    
    //Varables for the custom validation
    @State var alert = false
    @State var error = ""
    
    var body: some View {
        
        VStack(spacing: 40) {
            VStack(spacing: 20) {
                //Profile Page title
                HStack {
                    //Profile Page Image
                    Image("profile")
                        .renderingMode(.template)
                        .font(.title)
                        .foregroundColor(Color("Pastel Blue"))
                        .padding(.top, 5)
                        .padding(.trailing, 5)
                    //Profile Page Text
                    Text("Profile")
                        .font(Font.custom("Aeonik-Bold", size: 32))
                        .foregroundColor(Color("Navy Blue"))
                    
                    Spacer()
                }
                
                //Custom Groupbox for profile screen description
                GroupBox(
                    content: { Text("edit your new full name or email address by entering the new info in the fields below.")
                            .font(Font.custom("Aeonik-Regular", size: 18))
                            .foregroundColor(Color("Navy Blue"))
                    })
                    .cornerRadius(20)
                    .groupBoxStyle(TransparentGroupBoxProfile())
            }
            .frame(width: UIScreen.main.bounds.width - 80)
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    Text("Full name")
                        .font(Font.custom("Aeonik-Bold", size: 24))
                        .foregroundColor(Color("Navy Blue"))
                    
                    //Fullname field
                    TextField(profileService.userInfo.fullname, text: $fullname)
                        .autocapitalization(.none)
                        .font(Font.custom("Aeonik-Regular", size: 20))
                        .padding(20)
                        .foregroundColor(Color("Navy Blue"))
                        .background(RoundedRectangle(cornerRadius: 12).stroke(self.fullname != "" ? Color("Pastel Blue") : self.color, lineWidth: 3))
                        .preferredColorScheme(.light)
                        .disableAutocorrection(true)
                }
                .padding(.bottom, 10)
                
                VStack(alignment: .leading) {
                    Text("Email")
                        .font(Font.custom("Aeonik-Bold", size: 24))
                        .foregroundColor(Color("Navy Blue"))
                    
                    //Email field
                    TextField(profileService.userInfo.email, text: $email)
                        .autocapitalization(.none)
                        .font(Font.custom("Aeonik-Regular", size: 20))
                        .padding(20)
                        .foregroundColor(Color("Navy Blue"))
                        .background(RoundedRectangle(cornerRadius: 12).stroke(self.email != "" ? Color("Pastel Blue") : self.color, lineWidth: 3))
                        .preferredColorScheme(.light)
                        .disableAutocorrection(true)
                }
                
                //Update Info Button
                Button(action: {
                    self.updateInfo()
                }) {
                    Text("update your info")
                        .font(Font.custom("Aeonik-Regular", size: 25))
                        .foregroundColor(Color("White"))
                        .padding(.vertical, 25)
                }
                .frame(width: UIScreen.main.bounds.width - 80)
                .background(Color("Navy Blue"))
                .cornerRadius(20)
                .padding(.top, 20)
            }
            .frame(width: UIScreen.main.bounds.width - 80)
            
            //Sign Out button
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
    
    //Function to clear input fields on success
    func clear() {
        self.email = ""
        self.fullname = ""
    }
    
    //Function to update the user details
    func updateInfo() {
        let db = FirestoreService.db.collection("users")
        let uid = Auth.auth().currentUser!.uid
        let userEmail = Auth.auth().currentUser?.email
        
        db.document(uid).updateData(["fullname" : self.fullname, "email" : self.email])
        
        if self.email != userEmail {
            Auth.auth().currentUser?.updateEmail(to: self.email) { error in
                if let error = error {
                    print(error)
                }
            }
        }
        
        profileService.fetchUser()
        self.clear()
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

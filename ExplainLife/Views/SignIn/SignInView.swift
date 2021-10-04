//
//  SignInView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/04.
//

import SwiftUI
import FirebaseAuth

struct SignInView: View {
    
    @State var color = Color("Navy Blue")
    @State var email = ""
    @State var password = ""
    @State var visible = false
    @Binding var show: Bool
    @State var alert = false
    @State var error = ""
    
    var body: some View {
        ZStack {
            ZStack(alignment: .topTrailing) {
                
                Color("White")
                    .ignoresSafeArea()
                
                GeometryReader {_ in
                    VStack {
                        
                        HStack {
                            Spacer()
                            
                            //Register button
                            Button(action: {
                                self.show.toggle()
                            }) {
                                Text("register")
                                    .font(Font.custom("Aeonik-Regular", size: 22))
                                    .foregroundColor(Color("Navy Blue"))
                                    .padding(.vertical, 15)
                                    .frame(width: 120, alignment: .center)
                            }
                            .padding(.top, 0)
                            .background(Color("Pastel Green"))
                            .cornerRadius(15)
                        }
                        
                        //Sign In Image
                        Image("Sign In")
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 280, alignment: .center)
                        
                        VStack(alignment: .leading, spacing: 2) {
                            //Sign welcome text
                            Text("welcome to explain life.")
                                .font(Font.custom("Aeonik-Light", size: 22))
                                .foregroundColor(Color("Navy Blue"))
                            //Sign In boilerplate text
                            Text("Sign in to your account.")
                                .font(Font.custom("Aeonik-Bold", size: 30))
                                .foregroundColor(Color("Navy Blue"))
                            
                            //Email input field
                            TextField("email", text: self.$email)
                                .autocapitalization(.none)
                                .font(Font.custom("Aeonik-Regular", size: 20))
                                .padding(20)
                                .foregroundColor(Color("Navy Blue"))
                                .background(RoundedRectangle(cornerRadius: 12).stroke(self.email != "" ? Color("Pastel Green") : self.color, lineWidth: 3))
                                .padding(.top, 30)
                                .preferredColorScheme(.light)
                            
                            HStack(spacing: 15) {
                                VStack {
                                    if self.visible {
                                        //Password input field
                                        TextField("password", text: self.$password)
                                            .font(Font.custom("Aeonik-Regular", size: 20))
                                            .foregroundColor(Color("Navy Blue"))
                                            .preferredColorScheme(.light)
                                            .autocapitalization(.none)
                                    } else  {
                                        SecureField("password", text: self.$password)
                                            .font(Font.custom("Aeonik-Regular", size: 20))
                                            .foregroundColor(Color("Navy Blue"))
                                            .preferredColorScheme(.light)
                                            .autocapitalization(.none)
                                    }
                                }
                                
                                //Show password icon
                                Button (action: {
                                    self.visible.toggle()
                                }) {
                                    Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                        .foregroundColor(Color("Navy Blue"))
                                }
                                    
                            }
                            .padding(20)
                            .background(RoundedRectangle(cornerRadius: 12).stroke(self.password != "" ? Color("Pastel Green") : self.color, lineWidth: 3))
                            .padding(.top, 20)
                            
                            //Forget password text
                            HStack {
                                Spacer()
                                
                                Button(action: {
                                    self.resetPassword()
                                }) {
                                    Text("forgot your password?")
                                        .font(Font.custom("Aeonik-Regular", size: 22))
                                        .foregroundColor(Color("Navy Blue"))
                                }
                            }
                            .padding(.top, 12)
                            
                            //Sign In Button
                            Button(action: {
                                self.verify()
                            }) {
                                Text("sign in")
                                    .font(Font.custom("Aeonik-Regular", size: 25))
                                    .foregroundColor(Color("Navy Blue"))
                                    .padding(.vertical, 25)
                                    .frame(width: UIScreen.main.bounds.width - 80)
                            }
                            .background(Color("Pastel Green"))
                            .cornerRadius(20)
                            .padding(.top, 40)
                        }
                        .padding(.top, 30)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    }
                    .padding(.horizontal, 30)
                }
            }
            
            if self.alert {
                ErrorView(alert: self.$alert, error: self.$error)
            }
        }
    }
    
    func verify() {
        if self.email != "" && self.password != "" {
            Auth.auth().signIn(withEmail: self.email, password: self.password) { (res, err) in
                if err != nil {
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }
        } else if self.email == "" && self.password != "" {
            self.error = "Please fill in your email."
            self.alert.toggle()
        } else if self.password == "" && self.email != "" { 
            self.error = "Please fill in your password."
            self.alert.toggle()
        } else {
            self.error = "Please fill in all your information."
            self.alert.toggle()
        }
    }
    
    func resetPassword() {
        if self.email != "" {
            Auth.auth().sendPasswordReset(withEmail: self.email) { (err) in
                if err != nil {
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                self.error = "RESET"
                self.alert.toggle()
            }
        } else {
            self.error = "Your email field is empty."
            self.alert.toggle()
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    
    @State static private var show = true
    
    static var previews: some View {
        SignInView(show: $show)
    }
}

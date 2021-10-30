//
//  SignUpView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/04.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    
    @State var color = Color("Navy Blue")
    @State var email = ""
    @State var fullname = ""
    @State var password = ""
    @State var visible = false
    @Binding var show: Bool
    @State var alert = false
    @State var error = ""
    @State var isLoading = false
    
    var body: some View {
        ZStack {
            ZStack(alignment: .topTrailing) {
                
                Color("White")
                    .ignoresSafeArea()
                
                GeometryReader {_ in
                    VStack {
                        
                        HStack {
                            //Register button
                            Button(action: {
                                self.show.toggle()
                            }) {
                                Image(systemName: "chevron.left")
                                    .font(.title)
                                    .foregroundColor(Color("Navy Blue"))
                                
                                Text("back")
                                    .font(Font.custom("Aeonik-Regular", size: 22))
                                    .foregroundColor(Color("Navy Blue"))
                            }
                            .padding(.vertical, 15)
                            .frame(width: 120, alignment: .center)
                            .background(Color("Pastel Green"))
                            .cornerRadius(15)
                            
                            Spacer()
                        }
                        
                        //Sign Up Image
                        Image("Sign Up")
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 260, alignment: .center)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            //Sign Up boilerplate text
                            Text("Create your account.")
                                .font(Font.custom("Aeonik-Bold", size: 30))
                                .foregroundColor(Color("Navy Blue"))
                            
                            //Email input field
                            TextField("fullname", text: self.$fullname)
                                .autocapitalization(.none)
                                .font(Font.custom("Aeonik-Regular", size: 20))
                                .foregroundColor(Color("Navy Blue"))
                                .padding(20)
                                .foregroundColor(.white)
                                .background(RoundedRectangle(cornerRadius: 12).stroke(self.fullname != "" ? Color("Pastel Green") : self.color, lineWidth: 3))
                                .padding(.top, 15)
                                .preferredColorScheme(.light)
                                .disableAutocorrection(true)
                            
                            //Email input field
                            TextField("email", text: self.$email)
                                .autocapitalization(.none)
                                .font(Font.custom("Aeonik-Regular", size: 20))
                                .foregroundColor(Color("Navy Blue"))
                                .padding(20)
                                .foregroundColor(.white)
                                .background(RoundedRectangle(cornerRadius: 12).stroke(self.email != "" ? Color("Pastel Green") : self.color, lineWidth: 3))
                                .padding(.top, 20)
                                .preferredColorScheme(.light)
                                .disableAutocorrection(true)
                            
                            HStack(spacing: 15) {
                                VStack {
                                    if self.visible {
                                        //Password input field
                                        TextField("password", text: self.$password)
                                            .font(Font.custom("Aeonik-Regular", size: 20))
                                            .foregroundColor(Color("Navy Blue"))
                                            .preferredColorScheme(.light)
                                            .autocapitalization(.none)
                                            .disableAutocorrection(true)
                                    } else  {
                                        SecureField("password", text: self.$password)
                                            .font(Font.custom("Aeonik-Regular", size: 20))
                                            .foregroundColor(Color("Navy Blue"))
                                            .preferredColorScheme(.light)
                                            .autocapitalization(.none)
                                            .disableAutocorrection(true)
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
                            
                            if isLoading {
                                ProgressView()
                                    .padding(.top, 70)
                                    .progressViewStyle(CircularProgressViewStyle(tint: Color("Pastel Green")))
                                    .frame(width: UIScreen.main.bounds.width - 80, height: 30)
                                    .scaleEffect(x: 1.6, y: 1.6, anchor: .center)
                            } else {
                                //Sign Up Button
                                Button(action: {
                                    self.signUp()
                                }) {
                                    Text("sign up")
                                        .font(Font.custom("Aeonik-Regular", size: 25))
                                        .foregroundColor(Color("Navy Blue"))
                                        .padding(.vertical, 25)
                                        .frame(width: UIScreen.main.bounds.width - 80)
                                }
                                .background(Color("Pastel Green"))
                                .cornerRadius(20)
                                .padding(.top, 40)
                            }
                        }
                        .padding(.top, 10)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    }
                    .padding(.horizontal, 30)
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
            if self.alert {
                ErrorView(alert: $alert, error: $error)
            }
        }
    }
    
    //Function to clear input fields on success
    func clear() {
        self.email = ""
        self.fullname = ""
        self.password = ""
    }
    
    //Sign up and verify user information
    func signUp() {
        self.isLoading = true
        
        if self.email != "" && self.password != "" && self.fullname != "" {
            AuthService.signUp(fullname: fullname, email: email, password: password, onSuccess: { (user) in
                self.isLoading = false
                self.clear()
            }, onError: { (errorMessage) in
                self.error = errorMessage
                self.alert.toggle()
                return
            })
        } else if self.email == "" && self.password != "" && self.fullname == "" {
            self.error = "Please enter in your fullname and email."
            self.isLoading = false
            self.alert.toggle()
        } else if self.email != "" && self.password != "" && self.fullname == "" {
            self.error = "Please enter in your fullname."
            self.isLoading = false
            self.alert.toggle()
        } else if self.email == "" && self.password == "" && self.fullname != "" {
            self.error = "Please enter in your email and your password."
            self.isLoading = false
            self.alert.toggle()
        } else if self.email != "" && self.password == "" && self.fullname == "" {
            self.error = "Please enter in your fullname and your password."
            self.isLoading = false
            self.alert.toggle()
        } else if self.email != "" && self.password == "" && self.fullname != "" {
            self.error = "Please enter your password."
            self.isLoading = false
            self.alert.toggle()
        } else {
            self.error = "Please fill in all your information."
            self.isLoading = false
            self.alert.toggle()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    
    @State static private var show = true
    
    static var previews: some View {
        SignUpView(show: $show)
    }
}

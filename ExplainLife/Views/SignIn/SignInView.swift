//
//  SignInView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/04.
//

import SwiftUI

struct SignInView: View {
    
    @State var color = Color("Navy Blue")
    @State var email = ""
    @State var password = ""
    @State var visible = false
    @Binding var show: Bool
    
    var body: some View {
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
                    
                    //Sign In Logo
                    Image("Sign In")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 280, alignment: .center)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        //Sign welcome text
                        Text("welcome back!")
                            .font(Font.custom("Aeonik-Light", size: 22))
                            .foregroundColor(Color("Navy Blue"))
                        //Sign In boilerplate text
                        Text("Sign in to your account.")
                            .font(Font.custom("Aeonik-Bold", size: 30))
                            .foregroundColor(Color("Navy Blue"))
                        
                        //Email input field
                        TextField("email", text: self.$email)
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
                                } else  {
                                    SecureField("password", text: self.$password)
                                        .font(Font.custom("Aeonik-Regular", size: 20))
                                        .foregroundColor(Color("Navy Blue"))
                                        .preferredColorScheme(.light)
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
                                
                            }) {
                                Text("forgot your password?")
                                    .font(Font.custom("Aeonik-Regular", size: 22))
                                    .foregroundColor(Color("Navy Blue"))
                            }
                        }
                        .padding(.top, 12)
                        
                        //Sign In Button
                        Button(action: {
                            
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
    }
}

struct SignInView_Previews: PreviewProvider {
    
    @State static private var show = true
    
    static var previews: some View {
        SignInView(show: $show)
    }
}

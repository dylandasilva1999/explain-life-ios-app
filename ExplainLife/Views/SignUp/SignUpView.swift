//
//  SignUpView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/04.
//

import SwiftUI

struct SignUpView: View {
    
    @State var color = Color("Navy Blue")
    @State var email = ""
    @State var password = ""
    @State var retypePassword = ""
    @State var visible = false
    @State var retypeVisible = false
    @Binding var show: Bool
    
    var body: some View {
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
                        TextField("email", text: self.$email)
                            .font(Font.custom("Aeonik-Regular", size: 20))
                            .foregroundColor(Color("Navy Blue"))
                            .padding(20)
                            .foregroundColor(.white)
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
                        
                        HStack(spacing: 15) {
                            VStack {
                                if self.retypeVisible {
                                    //Re-enter Password input field
                                    TextField("re-enter password", text: self.$retypePassword)
                                        .font(Font.custom("Aeonik-Regular", size: 20))
                                        .foregroundColor(Color("Navy Blue"))
                                        .preferredColorScheme(.light)
                                } else  {
                                    SecureField("re-enter password", text: self.$retypePassword)
                                        .font(Font.custom("Aeonik-Regular", size: 20))
                                        .foregroundColor(Color("Navy Blue"))
                                        .preferredColorScheme(.light)
                                }
                            }
                            
                            //Show re-enter password icon
                            Button (action: {
                                self.retypeVisible.toggle()
                            }) {
                                Image(systemName: self.retypeVisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(Color("Navy Blue"))
                            }
                                
                        }
                        .padding(20)
                        .background(RoundedRectangle(cornerRadius: 12).stroke(self.retypePassword != "" ? Color("Pastel Green") : self.color, lineWidth: 3))
                        .padding(.top, 20)
                        
                        //Sign Up Button
                        Button(action: {
                            
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
    }
}

struct SignUpView_Previews: PreviewProvider {
    
    @State static private var show = true
    
    static var previews: some View {
        SignUpView(show: $show)
    }
}

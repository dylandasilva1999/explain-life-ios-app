//
//  SettingsView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/04.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack(spacing: 40) {
            VStack(spacing: 20) {
                //Page title
                HStack {
                    Image("settings")
                        .renderingMode(.template)
                        .font(.title)
                        .foregroundColor(Color("Pastel Pink"))
                        .padding(.top, 5)
                        .padding(.trailing, 5)
                    //Speak page text
                    Text("Settings")
                        .font(Font.custom("Aeonik-Bold", size: 32))
                        .foregroundColor(Color("Navy Blue"))
                    
                    Spacer()
                }
                //Custom Groupbox
                GroupBox(
                    content: { Text("edit and personalise the app to your needs by clicking on the appropriate item below.")
                            .font(Font.custom("Aeonik-Regular", size: 18))
                            .foregroundColor(Color("Navy Blue"))
                    })
                    .cornerRadius(20)
                    .groupBoxStyle(TransparentGroupBoxSettings())
            }
            .frame(width: UIScreen.main.bounds.width - 80)
            
            HStack {
                Button(action: {
                    openURL(URL(string: "https://aut2know.co.za/how-to-donate/")!)
                }) {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "globe.asia.australia.fill")
                                .renderingMode(.template)
                                .font(.title)
                                .foregroundColor(Color("Navy Blue"))
                            
                            Spacer()
                        }
                        .padding(.leading, 22)
                        .padding(.trailing, 22)
                        .padding(.top, 22)
                        .padding(.bottom, 2)
                        
                        HStack {
                            Text("Donate")
                                .font(Font.custom("Aeonik-Bold", size: 20))
                                .foregroundColor(Color("Navy Blue"))
                            
                            Spacer()
                        }
                        .padding(.leading, 22)
                        .padding(.trailing, 22)
                        
                        Text("Autism SA")
                            .font(Font.custom("Aeonik-Regular", size: 16))
                            .foregroundColor(Color("Navy Blue"))
                            .padding(.leading, 22)
                            .padding(.trailing, 22)
                            .padding(.bottom, 22)
                    }
                }
                .background(Color("Muted Pastel Pink"))
                .cornerRadius(20)
                
                Button(action: {
                    openURL(URL(string: "https://aut2know.co.za/contact-us-2/")!)
                }) {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "phone.fill")
                                .renderingMode(.template)
                                .font(.title)
                                .foregroundColor(Color("Navy Blue"))
                            
                            Spacer()
                        }
                        .padding(.leading, 22)
                        .padding(.trailing, 22)
                        .padding(.top, 22)
                        .padding(.bottom, 2)
                        
                        HStack {
                            Text("Need help?")
                                .font(Font.custom("Aeonik-Bold", size: 20))
                                .foregroundColor(Color("Navy Blue"))
                            
                            Spacer()
                        }
                        .padding(.leading, 22)
                        .padding(.trailing, 22)
                        
                        Text("Contact Support")
                            .font(Font.custom("Aeonik-Regular", size: 16))
                            .foregroundColor(Color("Navy Blue"))
                            .padding(.leading, 22)
                            .padding(.trailing, 22)
                            .padding(.bottom, 22)
                    }
                }
                .background(Color("Muted Pastel Pink"))
                .cornerRadius(20)
            }
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxWidth: UIScreen.main.bounds.width - 80)
            
            Spacer()
            
            //Say out loud button
            Button(action: {
                
            }) {
                Text("sign out of account")
                    .font(Font.custom("Aeonik-Regular", size: 25))
                    .foregroundColor(Color("Navy Blue"))
                    .padding(.vertical, 25)
            }
            .frame(width: UIScreen.main.bounds.width - 80)
            .background(Color("Pastel Pink"))
            .cornerRadius(20)
        }
        .frame(height: UIScreen.main.bounds.height - 200)
    }
}

//Transparent Custom GroupBoxStyle
struct TransparentGroupBoxSettings: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .frame(maxWidth: .infinity)
            .padding(30)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color("Muted Pastel Pink")))
            .overlay(configuration.label.padding(.leading, 0), alignment: .topLeading)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

//
//  EmotionView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/04.
//

import SwiftUI

struct EmotionView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                //Page title
                HStack {
                    Image("emotion")
                        .renderingMode(.template)
                        .font(.title)
                        .foregroundColor(Color("Pastel Orange"))
                        .padding(.top, 5)
                        .padding(.trailing, 5)
                    //Speak page text
                    Text("Emotion")
                        .font(Font.custom("Aeonik-Bold", size: 32))
                        .foregroundColor(Color("Navy Blue"))
                    
                    Spacer()
                }
                //Custom Groupbox
                GroupBox(
                    content: { Text("click on any of the emotion cards below to say out loud how you are feeling.")
                            .font(Font.custom("Aeonik-Regular", size: 18))
                            .foregroundColor(Color("Navy Blue"))
                    })
                    .cornerRadius(20)
                    .groupBoxStyle(TransparentGroupBoxEmotion())
            }
            .frame(width: UIScreen.main.bounds.width - 80)
            
            VStack(spacing: 20) {
                HStack(spacing: 20) {
                    //Joy Button
                    Button(action: {

                    }) {
                        VStack {
                            Image("joy")
                                .font(.title)
                                .foregroundColor(Color("Navy Blue"))
                                .padding(.top, 15)
                            
                            Text("joy")
                                .font(Font.custom("Aeonik-Regular", size: 20))
                                .foregroundColor(Color("Navy Blue"))
                                .padding(.bottom, 15)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width/2.65)
                    .background(Color("Muted Pastel Orange"))
                    .cornerRadius(30)
                    
                    //Trust Button
                    Button(action: {

                    }) {
                        VStack {
                            Image("trust")
                                .font(.title)
                                .foregroundColor(Color("Navy Blue"))
                                .padding(.top, 15)
                            
                            Text("trust")
                                .font(Font.custom("Aeonik-Regular", size: 20))
                                .foregroundColor(Color("Navy Blue"))
                                .padding(.bottom, 15)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width/2.65)
                    .background(Color("Muted Pastel Orange"))
                    .cornerRadius(30)
                }
                
                HStack(spacing: 20) {
                    //Joy Button
                    Button(action: {

                    }) {
                        VStack {
                            Image("fear")
                                .font(.title)
                                .foregroundColor(Color("Navy Blue"))
                                .padding(.top, 15)
                            
                            Text("fear")
                                .font(Font.custom("Aeonik-Regular", size: 20))
                                .foregroundColor(Color("Navy Blue"))
                                .padding(.bottom, 15)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width/2.65)
                    .background(Color("Muted Pastel Orange"))
                    .cornerRadius(30)
                    
                    //Trust Button
                    Button(action: {

                    }) {
                        VStack {
                            Image("surprise")
                                .font(.title)
                                .foregroundColor(Color("Navy Blue"))
                                .padding(.top, 15)
                            
                            Text("surprise")
                                .font(Font.custom("Aeonik-Regular", size: 20))
                                .foregroundColor(Color("Navy Blue"))
                                .padding(.bottom, 15)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width/2.65)
                    .background(Color("Muted Pastel Orange"))
                    .cornerRadius(30)
                }
                
                HStack(spacing: 20) {
                    //Joy Button
                    Button(action: {

                    }) {
                        VStack {
                            Image("sadness")
                                .font(.title)
                                .foregroundColor(Color("Navy Blue"))
                                .padding(.top, 15)
                            
                            Text("sadness")
                                .font(Font.custom("Aeonik-Regular", size: 20))
                                .foregroundColor(Color("Navy Blue"))
                                .padding(.bottom, 15)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width/2.65)
                    .background(Color("Muted Pastel Orange"))
                    .cornerRadius(30)
                    
                    //Trust Button
                    Button(action: {

                    }) {
                        VStack {
                            Image("disgust")
                                .font(.title)
                                .foregroundColor(Color("Navy Blue"))
                                .padding(.top, 15)
                            
                            Text("disgust")
                                .font(Font.custom("Aeonik-Regular", size: 20))
                                .foregroundColor(Color("Navy Blue"))
                                .padding(.bottom, 15)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width/2.65)
                    .background(Color("Muted Pastel Orange"))
                    .cornerRadius(30)
                }
                
                HStack(spacing: 20) {
                    //Joy Button
                    Button(action: {

                    }) {
                        VStack {
                            Image("anger")
                                .font(.title)
                                .foregroundColor(Color("Navy Blue"))
                                .padding(.top, 15)
                            
                            Text("anger")
                                .font(Font.custom("Aeonik-Regular", size: 20))
                                .foregroundColor(Color("Navy Blue"))
                                .padding(.bottom, 15)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width/2.65)
                    .background(Color("Muted Pastel Orange"))
                    .cornerRadius(30)
                    
                    //Trust Button
                    Button(action: {

                    }) {
                        VStack {
                            Image("anticipation")
                                .font(.title)
                                .foregroundColor(Color("Navy Blue"))
                                .padding(.top, 15)
                            
                            Text("anticipation")
                                .font(Font.custom("Aeonik-Regular", size: 20))
                                .foregroundColor(Color("Navy Blue"))
                                .padding(.bottom, 15)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width/2.65)
                    .background(Color("Muted Pastel Orange"))
                    .cornerRadius(30)
                }
            }
        }
    }
}

//Transparent Custom GroupBoxStyle
struct TransparentGroupBoxEmotion: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .frame(maxWidth: .infinity)
            .padding(30)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color("Muted Pastel Orange")))
            .overlay(configuration.label.padding(.leading, 0), alignment: .topLeading)
    }
}

struct EmotionView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionView()
    }
}

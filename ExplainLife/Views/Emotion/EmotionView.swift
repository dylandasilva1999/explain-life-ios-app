//
//  EmotionView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/04.
//

import SwiftUI
import AVFoundation

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
                //Joy and Trust Buttons
                HStack(spacing: 20) {
                    //Joy Button
                    Button(action: {
                        let utterance = AVSpeechUtterance(string: "I am feeling joyful")
                        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                        
                        utterance.rate = 0.5
                        
                        let synthesizer = AVSpeechSynthesizer()
                        synthesizer.speak(utterance)
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
                        let utterance = AVSpeechUtterance(string: "I am feeling trustworthy")
                        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                        
                        utterance.rate = 0.5
                        
                        let synthesizer = AVSpeechSynthesizer()
                        synthesizer.speak(utterance)
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
                //Fear and Surprise Buttons
                HStack(spacing: 20) {
                    //Fear Button
                    Button(action: {
                        let utterance = AVSpeechUtterance(string: "I am a bit scared")
                        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                        
                        utterance.rate = 0.5
                        
                        let synthesizer = AVSpeechSynthesizer()
                        synthesizer.speak(utterance)
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
                    
                    //Surprise Button
                    Button(action: {
                        let utterance = AVSpeechUtterance(string: "I am feeling super surprised")
                        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                        
                        utterance.rate = 0.5
                        
                        let synthesizer = AVSpeechSynthesizer()
                        synthesizer.speak(utterance)
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
                //Sadness and Disgust Buttons
                HStack(spacing: 20) {
                    //Sadness Button
                    Button(action: {
                        let utterance = AVSpeechUtterance(string: "I am feeling down and sad")
                        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                        
                        utterance.rate = 0.5
                        
                        let synthesizer = AVSpeechSynthesizer()
                        synthesizer.speak(utterance)
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
                    
                    //Disgust Button
                    Button(action: {
                        let utterance = AVSpeechUtterance(string: "I am feeling disgusted")
                        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                        
                        utterance.rate = 0.5
                        
                        let synthesizer = AVSpeechSynthesizer()
                        synthesizer.speak(utterance)
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
                //Anger and Anticipation Buttons
                HStack(spacing: 20) {
                    //Anger Button
                    Button(action: {
                        let utterance = AVSpeechUtterance(string: "I am angry ggggrrr")
                        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                        
                        utterance.rate = 0.5
                        
                        let synthesizer = AVSpeechSynthesizer()
                        synthesizer.speak(utterance)
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
                    
                    //Anticipation Button
                    Button(action: {
                        let utterance = AVSpeechUtterance(string: "I am feeling anticipating")
                        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                        
                        utterance.rate = 0.5
                        
                        let synthesizer = AVSpeechSynthesizer()
                        synthesizer.speak(utterance)
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

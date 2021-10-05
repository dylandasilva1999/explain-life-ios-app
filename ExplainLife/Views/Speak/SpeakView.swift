//
//  SpeakView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/04.
//

import SwiftUI
import AVFoundation

struct SpeakView: View {
    
    @State var text = ""
    
    var body: some View {
        VStack(spacing: 40) {
            VStack(spacing: 20) {
                //Page title
                HStack {
                    Image("speak")
                        .renderingMode(.template)
                        .font(.title)
                        .foregroundColor(Color("Pastel Green"))
                        .padding(.top, 5)
                        .padding(.trailing, 5)
                    //Speak page text
                    Text("Speak")
                        .font(Font.custom("Aeonik-Bold", size: 32))
                        .foregroundColor(Color("Navy Blue"))
                    
                    Spacer()
                }
                //Custom Groupbox
                GroupBox(
                    content: { Text("type in the textbox below what you want to say and hit the say out loud button at the bottom.")
                            .font(Font.custom("Aeonik-Regular", size: 18))
                            .foregroundColor(Color("Navy Blue"))
                })
                .cornerRadius(20)
                .groupBoxStyle(TransparentGroupBoxSpeak())
            }
            .frame(width: UIScreen.main.bounds.width - 80)
            
            VStack(spacing: 20) {
                //Remeber text
                Text("Remeber to turn your sound up.")
                    .font(Font.custom("Aeonik-Bold", size: 22))
                    .foregroundColor(Color("Navy Blue"))
                    .frame(width: UIScreen.main.bounds.width - 80)
                    .multilineTextAlignment(.leading)
                
                //Text Area input
                TextArea(text: $text)
                    .frame(width: UIScreen.main.bounds.width - 80, height: 200)
                    .cornerRadius(30)
            }
            
            Spacer()
            
            //Say out loud button
            Button(action: {
                let utterance = AVSpeechUtterance(string: self.text)
                utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                
                utterance.rate = 0.5
                
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterance)
                
                text = "type here..."
            }) {
                Image("speak")
                    .font(.title)
                    .foregroundColor(Color("Navy Blue"))
                    .padding(.top, 5)
                    .padding(.trailing, 5)
                
                Text("say out loud")
                    .font(Font.custom("Aeonik-Regular", size: 25))
                    .foregroundColor(Color("Navy Blue"))
                    .padding(.vertical, 25)
            }
            .frame(width: UIScreen.main.bounds.width - 80)
            .background(Color("Pastel Green"))
            .cornerRadius(20)
        }
        .frame(height: UIScreen.main.bounds.height - 200)
    }
}

struct SpeakView_Previews: PreviewProvider {
    static var previews: some View {
        SpeakView()
    }
}

//Transparent Custom GroupBoxStyle
struct TransparentGroupBoxSpeak: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .frame(maxWidth: .infinity)
            .padding(30)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color("Muted Pastel Green")))
            .overlay(configuration.label.padding(.leading, 0), alignment: .topLeading)
    }
}

//TextArea Input
struct TextArea: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let myTextArea = UITextView()
        myTextArea.delegate = context.coordinator
        myTextArea.font = UIFont(name: "Aeonik-Regular", size: 22)
        myTextArea.backgroundColor = UIColor(Color("Muted Pastel Green"))
        myTextArea.contentInset = UIEdgeInsets(top: 20, left: 25, bottom: 25, right: 25)
        myTextArea.text = "Placeholder"
        myTextArea.textColor = UIColor(Color("Navy Blue"))
        
        return myTextArea
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator : NSObject, UITextViewDelegate {
        
        var parent: TextArea
        
        init(_ uiTextView: TextArea) {
            self.parent = uiTextView
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
        }
    }
}

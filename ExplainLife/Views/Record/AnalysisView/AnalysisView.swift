//
//  AnalysisView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/12.
//

import SwiftUI
import ToneAnalyzer

struct AnalysisView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var swiftUISpeech:SwiftUISpeech
    
    var body: some View {
        VStack {
            //Prints results to screen
            Text("\(swiftUISpeech.analysisText)")
                .font(Font.custom("Aeonik-Bold", size: 20))
                .foregroundColor(Color("White"))
                .frame(width: UIScreen.main.bounds.width - 95, height: 180)
                .multilineTextAlignment(.leading)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Dismiss Modal")
            })
            
            Button(action: {
                self.configureToneAnalyzer()
            }, label: {
                Text("Analyse")
            })
                .padding(.top, 200)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Pastel Purple"))
        .edgesIgnoringSafeArea(.all)
    }
    
    // Method to configure the Tone Analyzer SDK
    func configureToneAnalyzer() {
        let authenticator = WatsonIAMAuthenticator(apiKey: "Hg2LSkfvwpVS3EfelDBMRUwXaLBQ_oYL-LDJem8hDD2P")
        let toneAnalyzer = ToneAnalyzer(version: "2017-09-21", authenticator: authenticator)
        toneAnalyzer.serviceURL = "https://api.au-syd.tone-analyzer.watson.cloud.ibm.com/instances/1956e6e2-d646-40cf-8bb5-33ad0ac7f322"

        let utterances = [
            Utterance(text: swiftUISpeech.analysisText),
        ]

        toneAnalyzer.toneChat(
          utterances: utterances,
          acceptLanguage: "en")
        {
          response, error in

          guard let analyses = response?.result else {
            print(error as Any)
            return
          }
          
          print(analyses)
        }
    }
}

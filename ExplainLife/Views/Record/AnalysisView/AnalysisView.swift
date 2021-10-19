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
                .foregroundColor(Color("Navy Blue"))
                .frame(width: UIScreen.main.bounds.width - 95, height: 180)
                .multilineTextAlignment(.leading)
            
            VStack(spacing: 30) {
                Button(action: {
                    self.doToneAnalyzer()
                }, label: {
                    Text("view tone of sentence")
                        .font(Font.custom("Aeonik-Regular", size: 25))
                        .foregroundColor(Color("Navy Blue"))
                        .padding(.vertical, 25)
                })
                    .frame(width: UIScreen.main.bounds.width - 80)
                    .background(Color("Pastel Green"))
                    .cornerRadius(20)
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "clear")
                        .font(.title2)
                        .foregroundColor(Color("Navy Blue"))
                        .padding(.top, 5)
                        .padding(.trailing, 5)
                    
                    Text("dismiss modal")
                        .font(Font.custom("Aeonik-Regular", size: 25))
                        .foregroundColor(Color("Navy Blue"))
                        .padding(.vertical, 25)
                })
                    .frame(width: UIScreen.main.bounds.width - 80)
                    .background(Color("Pastel Orange"))
                    .cornerRadius(20)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("White"))
        .edgesIgnoringSafeArea(.all)
    }
    
    //Function to analyse the analysis text input
    func doToneAnalyzer() {
        let authenticator = WatsonIAMAuthenticator(apiKey: "Hg2LSkfvwpVS3EfelDBMRUwXaLBQ_oYL-LDJem8hDD2P")
        let toneAnalyzer = ToneAnalyzer(version: "2017-09-21", authenticator: authenticator)
        toneAnalyzer.serviceURL = "https://api.au-syd.tone-analyzer.watson.cloud.ibm.com/instances/1956e6e2-d646-40cf-8bb5-33ad0ac7f322"
        
        let text = swiftUISpeech.analysisText
        
        toneAnalyzer.tone(
          toneContent: .text(text))
        {
          response, error in

          guard let toneAnalysis = response?.result else {
            print(error as Any)
            return
          }

          print(toneAnalysis)
        }
    }
}

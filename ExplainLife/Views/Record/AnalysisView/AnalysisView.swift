//
//  AnalysisView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/12.
//

import SwiftUI
import ToneAnalyzer
import SwiftyJSON
import Alamofire

struct AnalysisView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var swiftUISpeech:SwiftUISpeech
    @ObservedObject var analyzeText: AnalyzeText
    
    init(analyzeText: AnalyzeText) {
        self.analyzeText = analyzeText
    }
    
    var body: some View {
        VStack {
            //Prints results to screen
            Text("\(swiftUISpeech.analysisText)")
                .font(Font.custom("Aeonik-Bold", size: 20))
                .foregroundColor(Color("Navy Blue"))
                .frame(width: UIScreen.main.bounds.width - 95, height: 180)
                .multilineTextAlignment(.leading)
            
            ForEach(analyzeText.toneData) { i in
                SentenceToneView(name: i.toneName, score: i.toneScore)
            }
            
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
        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
        .background(Color("White"))
        .edgesIgnoringSafeArea(.all)
    }
}

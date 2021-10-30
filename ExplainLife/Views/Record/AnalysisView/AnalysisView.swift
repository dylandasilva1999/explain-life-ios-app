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
        VStack(spacing: 40) {
            VStack(spacing: 20) {
                //Page title
                HStack {
                    Image(systemName: "info.circle.fill")
                        .renderingMode(.template)
                        .font(.title)
                        .foregroundColor(Color("Navy Blue"))
                        .padding(.top, 5)
                        .padding(.trailing, 5)
                    //Speak page text
                    Text("Insights")
                        .font(Font.custom("Aeonik-Bold", size: 32))
                        .foregroundColor(Color("Navy Blue"))
                    
                    Spacer()
                }
                //Custom Groupbox
                GroupBox(
                    content: { Text("view what emotion and tone is meant by the content of each individual sentence you record.")
                            .font(Font.custom("Aeonik-Regular", size: 18))
                            .foregroundColor(Color("Navy Blue"))
                    })
                    .cornerRadius(20)
                    .groupBoxStyle(TransparentGroupBoxInsights())
            }
            .frame(width: UIScreen.main.bounds.width - 80)
            
            VStack(spacing: 10) {
                VStack(spacing: 30) {
                    //Tip Text
                    Text("Here is the sentence you recorded:")
                        .font(Font.custom("Aeonik-Bold", size: 20))
                        .foregroundColor(Color("Navy Blue"))
                        .frame(width: UIScreen.main.bounds.width - 80)
                        .multilineTextAlignment(.leading)
                    
                    //Prints results to screen
                    Text("\(analyzeText.analysisText)")
                        .font(Font.custom("Aeonik-Regular", size: 22))
                        .foregroundColor(Color("Navy Blue"))
                        .frame(width: UIScreen.main.bounds.width - 80)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width - 80, height: UIScreen.main.bounds.height - 720)
                .padding(.top, 30)
                
                ForEach(analyzeText.toneData) { i in
                    SentenceToneView(name: i.toneName)
                }
                
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "clear")
                        .font(.title2)
                        .foregroundColor(Color("White"))
                        .padding(.top, 5)
                        .padding(.trailing, 5)
                    
                    Text("dismiss modal")
                        .font(Font.custom("Aeonik-Regular", size: 25))
                        .foregroundColor(Color("White"))
                        .padding(.vertical, 25)
                })
                    .frame(width: UIScreen.main.bounds.width - 80)
                    .background(Color("Navy Blue"))
                    .cornerRadius(20)
            }
        }
        .frame(height: UIScreen.main.bounds.height - 160)
    }
}

//Transparent Custom GroupBoxStyle
struct TransparentGroupBoxInsights: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .frame(maxWidth: .infinity)
            .padding(30)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color("Muted Navy Blue")))
            .overlay(configuration.label.padding(.leading, 0), alignment: .topLeading)
    }
}

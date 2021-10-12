//
//  RecordView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/04.
//

import SwiftUI

struct RecordView: View {
    
    @EnvironmentObject var swiftUISpeech:SwiftUISpeech
    public var analysisText : String = ""
    @State private var isPresented = false
    
    var body: some View {
        VStack(spacing: 40) {
            VStack(spacing: 20) {
                //Page title
                HStack {
                    Image("record")
                        .renderingMode(.template)
                        .font(.title)
                        .foregroundColor(Color("Pastel Purple"))
                        .padding(.top, 5)
                        .padding(.trailing, 5)
                    //Speak page text
                    Text("Record")
                        .font(Font.custom("Aeonik-Bold", size: 32))
                        .foregroundColor(Color("Navy Blue"))
                    
                    Spacer()
                }
                //Custom Groupbox
                GroupBox(
                    content: { Text("press the circle waveform button in the center to start recording a conversation.")
                            .font(Font.custom("Aeonik-Regular", size: 18))
                            .foregroundColor(Color("Navy Blue"))
                    })
                    .cornerRadius(20)
                    .groupBoxStyle(TransparentGroupBoxRecord())
            }
            .frame(width: UIScreen.main.bounds.width - 80)
            
            VStack(spacing: 10) {
                //Tip Text
                Text("Record one sentence at a time.")
                    .font(Font.custom("Aeonik-Bold", size: 22))
                    .foregroundColor(Color("Navy Blue"))
                    .frame(width: UIScreen.main.bounds.width - 80)
                    .multilineTextAlignment(.leading)
                
                VStack{
                    //Prints results to screen
                    Text("\(swiftUISpeech.outputText)")
                        .font(Font.custom("Aeonik-Bold", size: 20))
                        .foregroundColor(Color("Pastel Purple"))
                        .frame(width: UIScreen.main.bounds.width - 95, height: 180)
                        .multilineTextAlignment(.leading)
                }
                .frame(width: UIScreen.main.bounds.width - 80, height: UIScreen.main.bounds.height - 720)
                .padding(.top, 10)
                
                VStack {
                    //Speech button
                    swiftUISpeech.getButton()
                        .padding(.top, 25)
                    Spacer()
                }
            }
            
            Spacer()
            
            //Say out loud button
            Button(action: {
                self.isPresented.toggle()
            }) {
                Image(systemName: "info.circle.fill")
                    .font(.title2)
                    .foregroundColor(Color("Navy Blue"))
                    .padding(.top, 5)
                    .padding(.trailing, 5)
                
                Text("view insights")
                    .font(Font.custom("Aeonik-Regular", size: 25))
                    .foregroundColor(Color("Navy Blue"))
                    .padding(.vertical, 25)
            }
            .frame(width: UIScreen.main.bounds.width - 80)
            .background(Color("Pastel Purple"))
            .cornerRadius(20)
            .fullScreenCover(isPresented: $isPresented, content: AnalysisView.init)
        }
        .frame(height: UIScreen.main.bounds.height - 200)
    }
}

//Transparent Custom GroupBoxStyle
struct TransparentGroupBoxRecord: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .frame(maxWidth: .infinity)
            .padding(30)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color("Muted Pastel Purple")))
            .overlay(configuration.label.padding(.leading, 0), alignment: .topLeading)
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView().environmentObject(SwiftUISpeech())
    }
}

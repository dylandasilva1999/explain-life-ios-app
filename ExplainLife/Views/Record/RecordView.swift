//
//  RecordView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/04.
//

import SwiftUI

struct RecordView: View {
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
                    content: { Text("press the record button at the bottom to start recording a conversation and gain insight.")
                            .font(Font.custom("Aeonik-Regular", size: 18))
                            .foregroundColor(Color("Navy Blue"))
                })
                .cornerRadius(20)
                .groupBoxStyle(TransparentGroupBoxRecord())
            }
            .frame(width: UIScreen.main.bounds.width - 80)
            
            VStack(spacing: 20) {
                //Remeber text
                Text("Record a sentence at a time.")
                    .font(Font.custom("Aeonik-Bold", size: 22))
                    .foregroundColor(Color("Navy Blue"))
                    .frame(width: UIScreen.main.bounds.width - 80)
                    .multilineTextAlignment(.leading)
        
            }
            
            Spacer()
            
            //Say out loud button
            Button(action: {

            }) {
                Image("record")
                    .font(.title)
                    .foregroundColor(Color("Navy Blue"))
                    .padding(.top, 5)
                    .padding(.trailing, 5)
                
                Text("record conversation")
                    .font(Font.custom("Aeonik-Regular", size: 25))
                    .foregroundColor(Color("Navy Blue"))
                    .padding(.vertical, 25)
            }
            .frame(width: UIScreen.main.bounds.width - 80)
            .background(Color("Pastel Purple"))
            .cornerRadius(20)
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
        RecordView()
    }
}

//
//  SentenceToneView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/19.
//

import SwiftUI

struct SentenceToneView : View {
    var name = ""
    @State var color = Color("White")
    
    var body: some View {
        HStack {
            if name == "Sadness" {
                Image("sadness")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color("Navy Blue"))
                    .frame(width: 40, height: 40, alignment: .center)
                    .padding(.trailing, 10)
            } else if name == "Fear" {
                Image("fear")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color("Navy Blue"))
                    .frame(width: 40, height: 40, alignment: .center)
                    .padding(.trailing, 10)
            } else if name == "Joy" {
                Image("joy")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color("Navy Blue"))
                    .frame(width: 40, height: 40, alignment: .center)
                    .padding(.trailing, 10)
            } else if name == "Anger" {
                Image("anger")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color("Navy Blue"))
                    .frame(width: 40, height: 40, alignment: .center)
                    .padding(.trailing, 10)
            } else if name == "Analytical" {
                Image("analytical")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color("Navy Blue"))
                    .frame(width: 40, height: 40, alignment: .center)
                    .padding(.trailing, 10)
            } else if name == "Confident" {
                Image("confident")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color("Navy Blue"))
                    .frame(width: 40, height: 40, alignment: .center)
                    .padding(.trailing, 10)
            } else {
                Image("tentative")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color("Navy Blue"))
                    .frame(width: 40, height: 40, alignment: .center)
                    .padding(.trailing, 10)
            }
            
            Text(name)
                .font(Font.custom("Aeonik-Bold", size: 40))
                .foregroundColor(Color("Navy Blue"))
        }
        .frame(width: UIScreen.main.bounds.width - 80, height: 180)
        .background(name == "Sadness" ? Color("Sadness") : name == "Fear" ? Color("Fear") : name == "Joy" ? Color("Joy") : name == "Anger" ? Color("Anger") : name == "Analytical" ? Color("Anticipation") : name == "Confident" ? Color("Joy") : name == "Tentative" ? Color("Disgust") : Color("White"))
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

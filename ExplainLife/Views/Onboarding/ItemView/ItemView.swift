//
//  ItemView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/04.
//

import SwiftUI

//Onboarding Item View
struct ItemView: View {
    
    //Instance of item
    var item: Item
    
    var body: some View {
        ZStack {
            //Background Colour
            Color("White")
                .ignoresSafeArea()
            
            //VStack for all onboarding content
            VStack {
                //Onboarding Image
                Image(item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                
                VStack {
                    //Onboarding Title Text
                    if (item.titleStart == "Speak ") {
                        Text(item.titleStart)
                            .font(Font.custom("Aeonik-Bold", size: 28))
                            .foregroundColor(Color("Pastel Green"))
                        + Text(item.titleEnd)
                            .font(Font.custom("Aeonik-Bold", size: 28))
                            .foregroundColor(Color("Navy Blue"))
                    } else if (item.titleStart == "Understand ") {
                        Text(item.titleStart)
                            .font(Font.custom("Aeonik-Bold", size: 28))
                            .foregroundColor(Color("Pastel Purple"))
                        + Text(item.titleEnd)
                            .font(Font.custom("Aeonik-Bold", size: 28))
                            .foregroundColor(Color("Navy Blue"))
                    } else {
                        Text(item.titleStart)
                            .font(Font.custom("Aeonik-Bold", size: 28))
                            .foregroundColor(Color("Pastel Orange"))
                        + Text(item.titleEnd)
                            .font(Font.custom("Aeonik-Bold", size: 28))
                            .foregroundColor(Color("Navy Blue"))
                    }
                    
                    //Onboarding Detail Text
                    Text(item.detail)
                        .font(Font.custom("Aeonik-Regular", size: 18))
                        .foregroundColor(Color("Navy Blue"))
                        .lineSpacing(5)
                        .padding(.top, 10)
                    
                }
                .frame(width: 320, height: 180, alignment: .topLeading)
                
                Spacer()
            }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: Item(image: "", titleStart: "", titleEnd: "", detail: ""))
    }
}

//
//  SentenceToneView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/19.
//

import SwiftUI

struct SentenceToneView : View {
    var name = ""
    var score = ""
    
    var body: some View {
        HStack {
            Text(name)
                .font(Font.custom("Aeonik-Regular", size: 25))
                .foregroundColor(Color("Navy Blue"))
            
            Text(score)
                .font(Font.custom("Aeonik-Regular", size: 25))
                .foregroundColor(Color("Navy Blue"))
        }
    }
}

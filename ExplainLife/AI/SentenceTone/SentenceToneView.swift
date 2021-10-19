//
//  SentenceToneView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/19.
//

import SwiftUI

struct SentenceToneView : View {
    var name = ""
    
    var body: some View {
        HStack {
            Text(name)
                .font(Font.custom("Aeonik-Bold", size: 40))
                .foregroundColor(Color("Navy Blue"))
        }
        .frame(width: UIScreen.main.bounds.width - 80, height: 180)
    }
}

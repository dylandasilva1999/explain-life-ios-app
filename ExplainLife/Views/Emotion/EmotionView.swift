//
//  EmotionView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/04.
//

import SwiftUI

struct EmotionView: View {
    var body: some View {
        ZStack {
            Color("Pastel Orange")
                .edgesIgnoringSafeArea(.all)
            Text("Emotion View")
        }
    }
}

struct EmotionView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionView()
    }
}

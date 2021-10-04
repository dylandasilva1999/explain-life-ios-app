//
//  SpeakView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/04.
//

import SwiftUI

struct SpeakView: View {
    var body: some View {
        ZStack {
            Color("Pastel Green")
                .edgesIgnoringSafeArea(.all)
            Text("Speak View")
        }
    }
}

struct SpeakView_Previews: PreviewProvider {
    static var previews: some View {
        SpeakView()
    }
}

//
//  AnalysisView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/12.
//

import SwiftUI

struct AnalysisView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("This is the Analysis View")
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Dismiss Modal")
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Pastel Purple"))
        .edgesIgnoringSafeArea(.all)
    }
}

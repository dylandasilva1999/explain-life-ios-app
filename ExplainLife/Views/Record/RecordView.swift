//
//  RecordView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/04.
//

import SwiftUI

struct RecordView: View {
    var body: some View {
        ZStack {
            Color("Pastel Purple")
                .edgesIgnoringSafeArea(.all)
            Text("Record View")
        }
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}

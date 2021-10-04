//
//  SettingsView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/04.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            Color("Pastel Pink")
                .edgesIgnoringSafeArea(.all)
            Text("Settings View")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

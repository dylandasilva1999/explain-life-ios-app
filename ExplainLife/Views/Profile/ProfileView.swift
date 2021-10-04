//
//  ProfileView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/04.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color("Pastel Blue")
                .edgesIgnoringSafeArea(.all)
            Text("Profile View")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

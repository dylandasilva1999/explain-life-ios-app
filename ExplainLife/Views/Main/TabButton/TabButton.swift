//
//  TabButton.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/04.
//

import SwiftUI

struct TabButton: View {
    
    var title : String
    @Binding var selectedTab : String
    
    var body: some View {
        Button(action: {
            withAnimation {
                selectedTab = title
            }
        }) {
            VStack(spacing: 6) {
                
                //Custom Shape
                CustomShape()
                    .fill(Color("Pastel Green").opacity(selectedTab == title ? 1 : 0))
                    .frame(width: 60, height: 6)
                    .padding(.bottom, 10)
                
                //Tab Item Image
                Image(title)
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(selectedTab == title ? Color("Pastel Green") : Color("Navy Blue").opacity(1.0))
                    .frame(width: 35, height: 35)
                
                //Tab Item Text
                Text(title)
                    .font(Font.custom("Aeonik-Regular", size: 14))
                    .foregroundColor(Color("Navy Blue").opacity(selectedTab == title ? 1.0 : 1.0))
            }
        }
    }
}

//Custom Selected Tab Shape
struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft, .bottomRight, .topLeft, .topRight], cornerRadii: CGSize(width: 10, height: 10))
        
        return Path(path.cgPath)
    }
}

struct TabButton_Previews: PreviewProvider {
    
    @State static private var selectedTab = ""
    
    static var previews: some View {
        TabButton(title: "", selectedTab: $selectedTab)
    }
}

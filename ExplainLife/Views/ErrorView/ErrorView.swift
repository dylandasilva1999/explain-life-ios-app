//
//  ErrorView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/04.
//

import SwiftUI

struct ErrorView: View {
    
    @State var color = Color.black.opacity(0.7)
    @Binding var alert : Bool
    @Binding var error: String
    
    var body: some View {
        GeometryReader{_ in
            VStack {
                HStack {
                    Text("Almost there...")
                        .font(Font.custom("Aeonik-Bold", size: 25))
                        .foregroundColor(Color("Navy Blue"))
                    
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 5)
                
                HStack {
                    Text(self.error)
                        .font(Font.custom("Aeonik-Regular", size: 20))
                        .foregroundColor(Color("Navy Blue"))
                        .multilineTextAlignment(.leading)
                        
                    Spacer()
                }
                .padding(.top)
                .padding(.horizontal, 30)
                
                Button(action: {
                    self.alert.toggle()
                }) {
                    Text("Cancel")
                        .font(Font.custom("Aeonik-Regular", size: 25))
                        .foregroundColor(Color("Navy Blue"))
                        .padding(.vertical, 22)
                        .frame(width: UIScreen.main.bounds.width - 125)
                }
                .background(Color("Pastel Green"))
                .cornerRadius(20)
                .padding(.top, 20)
            }
            .padding(.vertical, 25)
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color("White"))
            .cornerRadius(20)
            .position(x: UIScreen.main.bounds.width/2, y:UIScreen.main.bounds.height/2.2)
        }
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
    }
    
}

struct ErrorView_Previews: PreviewProvider {
    
    @State static private var alert = true
    @State static private var error = ""
    
    static var previews: some View {
        ErrorView(alert: $alert, error: $error)
    }
}

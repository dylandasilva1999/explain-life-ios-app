//
//  ErrorView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/04.
//

import SwiftUI

struct ErrorView: View {
    
    //Toggler to know when ErrorView is open
    @Binding var alert : Bool
    //Variable to hold the error message
    @Binding var error: String
    
    //Start of Body
    var body: some View {
        //Start of GeometryReader
        GeometryReader{_ in
            //Start of Main VStack
            VStack {
                //HStack is for the title text in ErrorView
                HStack {
                    Text(self.error == "RESET" ? "Message" : "Almost there...")
                        .font(Font.custom("Aeonik-Bold", size: 25))
                        .foregroundColor(Color("Navy Blue"))
                    
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 5)
                
                //HStack is for the error text in ErrorView
                HStack {
                    Text(self.error == "RESET" ? "A password reset link has been sent to your inbox" : self.error)
                        .font(Font.custom("Aeonik-Regular", size: 20))
                        .foregroundColor(Color("Navy Blue"))
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }
                .padding(.top)
                .frame(width: UIScreen.main.bounds.width - 125)
                
                //Button to close the ErrorView
                Button(action: {
                    self.alert.toggle()
                }) {
                    Text(self.error == "RESET" ? "Ok" : "close window")
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
            .cornerRadius(30)
            .position(x: UIScreen.main.bounds.width/2, y:UIScreen.main.bounds.height/2.2)
            //End of Main VStack
        }
        .background(Color.black.opacity(0.4).edgesIgnoringSafeArea(.all))
        //End of GeometryReader
    }
    //End of Body
}

struct ErrorView_Previews: PreviewProvider {
    
    @State static private var alert = true
    @State static private var error = ""
    
    static var previews: some View {
        ErrorView(alert: $alert, error: $error)
    }
}

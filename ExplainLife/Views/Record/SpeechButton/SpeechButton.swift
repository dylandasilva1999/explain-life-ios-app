//
//  SpeechButton.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/12.
//

import Speech
import SwiftUI
import Foundation

struct SpeechButton: View {
    
    @State var isPressed:Bool = false
    @State var actionPop:Bool = false
    @EnvironmentObject var swiftUISpeech:SwiftUISpeech
    
    var body: some View {
        
        //Button
        Button(action:{
            //Checks status of auth if no auth popup error
            if(self.swiftUISpeech.getSpeechStatus() == "Denied - Close the App"){
                self.actionPop.toggle()
            }else{
                //Button animation
                withAnimation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.2)){self.swiftUISpeech.isRecording.toggle()}
                self.swiftUISpeech.isRecording ? self.swiftUISpeech.startRecording() : self.swiftUISpeech.stopRecording()
            }
        }){
            HStack {
                //Button Image
                Image(systemName: "waveform")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .background(swiftUISpeech.isRecording ? Circle().foregroundColor(Color("Pastel Green")).frame(width: 85, height: 85) : Circle().foregroundColor(Color("Pastel Purple")).frame(width: 70, height: 70))
                
                VStack {
                    Text(swiftUISpeech.isRecording ? "Recording" : "Click to record")
                        .font(Font.custom("Aeonik-Regular", size: 22))
                        .foregroundColor(Color("Navy Blue"))
                        .padding(.leading, 30)
                        .multilineTextAlignment(.leading)
                }
                
            }
            
        }.actionSheet(isPresented: $actionPop){
            ActionSheet(title: Text("ERROR: - 1"), message: Text("Access Denied by User"), buttons: [ActionSheet.Button.destructive(Text("Reinstall the Appp"))])// Error catch if the auth failed or denied
        }
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        SpeechButton().environmentObject(SwiftUISpeech())
    }
}

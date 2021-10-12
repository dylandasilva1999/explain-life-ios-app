//
//  ContentView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/09/28.
//

import SwiftUI

//Content View
struct ContentView: View {
    
    @State var currentPage = 3
    @AppStorage("currentScreen") var currentScreen = 0
    @State var show = false
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    @EnvironmentObject var swiftUISpeech:SwiftUISpeech
    
    var body: some View {
        if currentScreen > 3 {
            NavigationView {
                
                VStack {
                    if self.status {
                        MainView()
                    } else {
                        ZStack {
                            NavigationLink(destination: SignUpView(show: self.$show), isActive: self.$show) {
                                Text("")
                            }
                            .hidden()
                            
                            SignInView(show: self.$show)
                        }
                    }
                }
                .navigationTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .onAppear {
                    NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) { (_) in
                        self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                    }
                }
            }
        } else {
            OnboardingScreenView()
        }
    }
}

//Content View Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

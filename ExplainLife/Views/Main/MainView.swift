//
//  MainView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/04.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    
    @State var selectedTab = "speak"
    //var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @EnvironmentObject var swiftUISpeech:SwiftUISpeech
    
    var body: some View {
        VStack(spacing: 0) {
            GeometryReader {_ in
                ZStack {
                    ScrollView {
                        if selectedTab == "speak" {
                            SpeakView()
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/1.1)
                                .transition(.opacity)
                        } else if selectedTab == "record" {
                            RecordView()
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/1.1)
                                .transition(.opacity)
                        } else if selectedTab == "emotion" {
                            EmotionView()
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/1.1)
                                .transition(.opacity)
                        } else if selectedTab == "profile" {
                            ProfileView()
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/1.1)
                                .transition(.opacity)
                        } else {
                            SettingsView()
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/1.1)
                                .transition(.opacity)
                        }
                    }
                }
            }
            
            //Tabview
            HStack(spacing: 0) {
                ForEach(tabs, id: \.self) { tab in
                    TabButton(title: tab, selectedTab: $selectedTab)
                    
                    if tab != tabs.last {
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 30)
            .background(Color("White"))
        }
        .ignoresSafeArea(.all)
        .background(Color("White").opacity(1).ignoresSafeArea(.all))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(SwiftUISpeech())
    }
}

var tabs = ["speak", "record", "emotion", "profile", "settings"]
var lineIcons = ["speak-line", "record-line", "emotion-line", "profile-line", "settings-line"]

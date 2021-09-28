//
//  ContentView.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/09/28.
//

import SwiftUI

struct ContentView: View {
    
    //Get screen width
    var screenWidth = UIScreen.main.bounds.width
    //xOffset variable
    @State var xOffset: CGFloat = 0
    //Var to hold currentPage
    @State var currentPage = 0
    //Check for last page
    var lastPage = data.count - 1
    //Check for first page
    var firstPage = 0
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            GeometryReader { reader in
                HStack(spacing: 0) {
                    ForEach(data) { item in
                        ItemView(item: item)
                        .frame(width: screenWidth)
                    }
                }
                .offset(x: xOffset)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            onChanged(value: value)
                        })
                        .onEnded({ value in
                            onEnded(value: value)
                        })
                )
            }
            
            //Page Progress Indicator
            VStack {
                Spacer()
                
                ZStack {
                    HStack(spacing: 6) {
                        ForEach(0 ..< data.count + 1) { i in
                            Circle()
                                .frame(width: 10, height: 8)
                                .foregroundColor(Color("Light Navy Blue"))
                            }
                        }
                    
                        HStack(spacing: 8) {
                            ForEach(0 ..< data.count) { i in
                                if i == currentPage {
                                    Capsule()
                                        .frame(width: 26, height: 8)
                                        .foregroundColor(Color("Navy Blue"))
                                        .animation(.easeIn)
                                        .matchedGeometryEffect(id: "page", in: namespace)
                                } else {
                                    Circle()
                                        .frame(width: 10, height: 8)
                                        .foregroundColor(Color("Light Navy Blue"))
                                }
                            }
                        }
                }
                
                HStack {
                    Spacer()
                    
                    if currentPage == 0 {
                        Button(action: {
                            currentPage = lastPage
                            withAnimation {
                                xOffset = -screenWidth * CGFloat(currentPage)
                            }
                        }, label: {
                            Text("skip")
                                .frame(maxWidth: .infinity)
                                .font(Font.custom("Aeonik-Regular", size: 24))
                                .foregroundColor(Color("Navy Blue"))
                        })
                        
                        Button(action: {
                            currentPage += 1
                            withAnimation {
                                xOffset = -screenWidth * CGFloat(currentPage)
                            }
                        }, label: {
                            HStack {
                                Text("next →")
                                    .padding(20)
                                    .padding(.leading, 25)
                                    .padding(.trailing, 25)
                                    .font(Font.custom("Aeonik-Regular", size: 24))
                                    .background(Color("Pastel Green"))
                                    .foregroundColor(Color("Navy Blue"))
                                    .cornerRadius(20)
                                    .animation(.spring())
                            }
                            .frame(maxWidth: .infinity)
                        })
                    } else if currentPage == 1 {
                        Button(action: {
                            currentPage = lastPage
                            withAnimation {
                                xOffset = -screenWidth * CGFloat(currentPage)
                            }
                        }, label: {
                            Text("skip")
                                .frame(maxWidth: .infinity)
                                .font(Font.custom("Aeonik-Regular", size: 24))
                                .foregroundColor(Color("Navy Blue"))
                        })
                        
                        Button(action: {
                            currentPage += 1
                            withAnimation {
                                xOffset = -screenWidth * CGFloat(currentPage)
                            }
                        }, label: {
                            HStack {
                                Text("next →")
                                    .padding(20)
                                    .padding(.leading, 25)
                                    .padding(.trailing, 25)
                                    .font(Font.custom("Aeonik-Regular", size: 24))
                                    .background(Color("Pastel Purple"))
                                    .foregroundColor(Color("Navy Blue"))
                                    .cornerRadius(20)
                                    .animation(.spring())
                            }
                            .frame(maxWidth: .infinity)
                        })
                    } else {
                        Button(action: {
                            currentPage += 1
                            withAnimation {
                                xOffset = -screenWidth * CGFloat(currentPage)
                            }
                        }, label: {
                            HStack {
                                Text("get started")
                                    .padding(20)
                                    .padding(.leading, 25)
                                    .padding(.trailing, 25)
                                    .font(Font.custom("Aeonik-Regular", size: 24))
                                    .background(Color("Pastel Orange"))
                                    .foregroundColor(Color("Navy Blue"))
                                    .cornerRadius(20)
                                    .animation(.spring())
                                    .frame(maxWidth: .infinity)
                            }
                        })
                    }
                }
                .frame(height: 110)
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
            }
        }
    }
    
    func onChanged(value: DragGesture.Value) {
        xOffset = value.translation.width - (screenWidth * CGFloat(currentPage))
    }
    
    func onEnded(value: DragGesture.Value) {
        if -value.translation.width > screenWidth / 2 && currentPage < lastPage {
            currentPage += 1
        } else {
            if value.translation.width > screenWidth / 2 && currentPage > firstPage {
                currentPage -= 1
            }
        }
        
        withAnimation {
            xOffset = -screenWidth * CGFloat(currentPage)
        }
    }
}

//Onboarding Item View
struct ItemView: View {
    
    //Instance of item
    var item: Item
    
    var body: some View {
        ZStack {
            //Background Colour
            Color("White")
                .ignoresSafeArea()
            
            //VStack for all onboarding content
            VStack {
                //Onboarding Image
                Image(item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                
                VStack {
                    //Onboarding Title Text
                    if (item.titleStart == "Speak ") {
                        Text(item.titleStart)
                            .font(Font.custom("Aeonik-Bold", size: 28))
                            .foregroundColor(Color("Pastel Green"))
                        + Text(item.titleEnd)
                            .font(Font.custom("Aeonik-Bold", size: 28))
                            .foregroundColor(Color("Navy Blue"))
                    } else if (item.titleStart == "Understand ") {
                        Text(item.titleStart)
                            .font(Font.custom("Aeonik-Bold", size: 28))
                            .foregroundColor(Color("Pastel Purple"))
                        + Text(item.titleEnd)
                            .font(Font.custom("Aeonik-Bold", size: 28))
                            .foregroundColor(Color("Navy Blue"))
                    } else {
                        Text(item.titleStart)
                            .font(Font.custom("Aeonik-Bold", size: 28))
                            .foregroundColor(Color("Pastel Orange"))
                        + Text(item.titleEnd)
                            .font(Font.custom("Aeonik-Bold", size: 28))
                            .foregroundColor(Color("Navy Blue"))
                    }
                    
                    //Onboarding Detail Text
                    Text(item.detail)
                        .font(Font.custom("Aeonik-Regular", size: 18))
                        .foregroundColor(Color("Navy Blue"))
                        .lineSpacing(5)
                        .padding(.top, 10)
                    
                }
                .frame(width: 320, height: 180, alignment: .topLeading)
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  Item.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/09/28.
//

import SwiftUI

//Item Struct
struct Item: Identifiable {
    let id = UUID().uuidString
    let image: String
    let titleStart: String
    let titleEnd: String
    let detail: String
}

//Onboarding Data
let data = [
    Item(image: "Onboarding 1", titleStart: "Speak ", titleEnd: "to others without using your voice.", detail: "Have social communication anxiety? With text-to-speech AI technology you can type what you want to say."),
    Item(image: "Onboarding 2", titleStart: "Understand ", titleEnd: "what others are saying.", detail: "Record a sentence in your conversation through speech-to-text to gain insight on what emotions are expressed."),
    Item(image: "Onboarding 3", titleStart: "Personalise ", titleEnd: "the app to your needs.", detail: "Want to app to fit your need? With built-in personalisation, you can change to app’s appearance for your fit.")
]

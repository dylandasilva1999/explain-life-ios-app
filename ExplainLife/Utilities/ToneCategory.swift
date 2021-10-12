//
//  ToneCategory.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/12.
//

import Foundation
import ToneAnalyzer

//Struct that will hold the Tone Category information for each cell
struct ToneCategory {
    //String that holds tone category id
    let toneCategoryId: String
    //String that holds tone category name
    let toneCategoryName: String
    //ToneScore object array that holds the tones
    let tones: [ToneScore]
}


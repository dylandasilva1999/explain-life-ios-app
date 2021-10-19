//
//  AnalyzeText.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/19.
//

import Foundation
import ToneAnalyzer
import SwiftyJSON
import Alamofire

//Class to analyse the analysis text input
class AnalyzeText : ObservableObject {
    
    @Published var toneData = [toneDataModel]()
    var swiftUISpeechText: SwiftUISpeech
    var analysisText: String
    
    init(swiftUISpeechText: SwiftUISpeech) {
        
        self.swiftUISpeechText = swiftUISpeechText
        
        let authenticator = WatsonIAMAuthenticator(apiKey: "Hg2LSkfvwpVS3EfelDBMRUwXaLBQ_oYL-LDJem8hDD2P")
        let toneAnalyzer = ToneAnalyzer(version: "2017-09-21", authenticator: authenticator)
        toneAnalyzer.serviceURL = "https://api.au-syd.tone-analyzer.watson.cloud.ibm.com/instances/1956e6e2-d646-40cf-8bb5-33ad0ac7f322"
        
        //Disable SSL Verification
        toneAnalyzer.disableSSLVerification()
        
        //Text to analyze
        let text = swiftUISpeechText.outputText.addingPercentEncoding(withAllowedCharacters: .symbols)
        
        self.analysisText = swiftUISpeechText.analysisText
        
        let dataUrlString: String!
        dataUrlString = "https://api.au-syd.tone-analyzer.watson.cloud.ibm.com/instances/1956e6e2-d646-40cf-8bb5-33ad0ac7f322/v3/tone?version=2017-09-21&sentences=false&text=\(text ?? "Hi")"
        
        let url = URL(string: dataUrlString)
        
        AF.request(url!).authenticate(username: "ApiKey", password: "Hg2LSkfvwpVS3EfelDBMRUwXaLBQ_oYL-LDJem8hDD2P").responseData { (data) in
            let json = try! JSON(data: data.data!)
            
            for i in json {
                let toneName = i.1["tones"][0]["tone_name"].stringValue
                let toneId = i.1["tones"][0]["tone_id"].stringValue
                let toneScore = i.1["tones"][0]["score"].stringValue
                
                self.toneData.append(toneDataModel(id: toneId, toneName: toneName, toneScore: toneScore))
                
                print(self.toneData)
            }
        }
    }
}

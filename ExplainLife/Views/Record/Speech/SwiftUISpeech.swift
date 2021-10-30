//
//  SwiftUISpeech.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/12.
//

import Speech
import SwiftUI
import Foundation

public class SwiftUISpeech: ObservableObject{
    
    //Variables
    @Published var isRecording : Bool = false
    @Published var button = SpeechButton()
    
    init(){
        //Requests auth from User
        SFSpeechRecognizer.requestAuthorization{ authStatus in
            OperationQueue.main.addOperation {
                switch authStatus {
                    case .authorized:
                        break

                    case .denied:
                        break
                    
                    case .restricted:
                        break
                      
                    case .notDetermined:
                        break
                      
                    default:
                        break
                }
            }
        }
        //End of auth request
        
        recognitionTask?.cancel()
        self.recognitionTask = nil
    }
    
    //Returns the button
    func getButton()->SpeechButton{
        return button
    }
    //End of get button
    
    //Starts the recording sequence
    func startRecording(){
        
        //Restarts the text
        outputText = "";
        
        //Configure the audio session for the app.
        let audioSession = AVAudioSession.sharedInstance()
        let inputNode = audioEngine.inputNode
        
        //Try catch to start audio session
        do{
            try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        }catch{
            print("ERROR: - Audio Session Failed!")
        }
        
        //Configure the microphone input and request auth
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        
        do{
            try audioEngine.start()
        }catch{
            print("ERROR: - Audio Engine failed to start")
        }
        
        //Create and configure the speech recognition request.
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let recognitionRequest = recognitionRequest else { fatalError("Unable to create a SFSpeechAudioBufferRecognitionRequest object") }
        recognitionRequest.shouldReportPartialResults = true
        
        //Create a recognition task for the speech recognition session.
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest){ result, error in
            if (result != nil){
                self.outputText = (result?.transcriptions[0].formattedString)!
                self.analysisText = self.outputText
            }
            if let result = result{
                //Update the text view with the results.
                self.outputText = result.transcriptions[0].formattedString
                self.analysisText = self.outputText
            }
            if error != nil {
                //Stop recognizing speech if there is a problem.
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                self.recognitionRequest = nil
                self.recognitionTask = nil
            }
        }
    }
    //End of stop recording
    
    //End recording
    func stopRecording(){
        audioEngine.stop()
        recognitionRequest?.endAudio()
        self.audioEngine.inputNode.removeTap(onBus: 0)
        self.recognitionTask?.cancel()
        self.recognitionTask = nil
        self.analysisText = self.outputText
    }
    //Restarts the variables
    
    //Gets the status of authorization
    func getSpeechStatus()->String{
        
        switch authStat{
            
            case .authorized:
                return "Authorized"
            
            case .notDetermined:
                return "Not yet Determined"
            
            case .denied:
                return "Denied - Close the App"
            
            case .restricted:
                return "Restricted - Close the App"
            
            default:
                return "ERROR: No Status Defined"
    
        }
        //End of switch
    }
    //End of get speech status
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
    private var recognitionRequest : SFSpeechAudioBufferRecognitionRequest?
    private let authStat = SFSpeechRecognizer.authorizationStatus()
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    public var outputText : String = ""
    public var analysisText : String = ""
}

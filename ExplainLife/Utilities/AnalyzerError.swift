//
//  AnalyzerError.swift
//  ExplainLife
//
//  Created by Dylan da Silva on 2021/10/12.
//

import Foundation

enum AnalyzerError: Error, CustomStringConvertible {

    case missingCredentials

    case invalidCredentials

    case noData

    case error(String)

    var title: String {
        switch self {
        case .missingCredentials: return "Missing Tone Analyzer Credentials"
        case .invalidCredentials: return "Invalid Tone Analyzer Credentials"
        case .noData: return "Bad Response"
        case .error: return "An error occurred"
        }
    }

    var message: String {
        switch self {
        case .missingCredentials: return "Please check the readme for more information on credentials configuration."
        case .invalidCredentials: return "Please check the readme for more information on credentials configuration."
        case .noData: return "No Tone Analyzer data was received."
        case .error(let msg): return msg
        }
    }

    var description: String {
        return title + ": " + message
    }
}

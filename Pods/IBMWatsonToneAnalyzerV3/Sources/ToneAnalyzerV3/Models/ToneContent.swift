/**
 * (C) Copyright IBM Corp. 2018, 2020.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import Foundation
import IBMSwiftSDKCore

/**
 JSON, plain text, or HTML input that contains the content to be analyzed. For JSON input, provide an object of type
 `ToneInput`.
 */
public enum ToneContent {

    case toneInput(ToneInput)
    case html(String)
    case text(String)

    internal var contentType: String {
        switch self {
        case .toneInput: return "application/json"
        case .html: return "text/html"
        case .text: return "text/plain"
        }
    }

    internal var content: Data? {
        switch self {
        case .toneInput(let toneInput): return try? JSON.encoder.encode(toneInput)
        case .html(let html): return html.data(using: .utf8)
        case .text(let text): return text.data(using: .utf8)
        }
    }

}

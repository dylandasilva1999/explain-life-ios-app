/**
 * (C) Copyright IBM Corp. 2016, 2020.
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

/**
 * IBM OpenAPI SDK Code Generator Version: 99-SNAPSHOT-36b26b63-20201028-122900
 **/

// swiftlint:disable file_length

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
import IBMSwiftSDKCore

public typealias WatsonError = RestError
public typealias WatsonResponse = RestResponse
/**
 The IBM Watson&trade; Tone Analyzer service uses linguistic analysis to detect emotional and language tones in written
 text. The service can analyze tone at both the document and sentence levels. You can use the service to understand how
 your written communications are perceived and then to improve the tone of your communications. Businesses can use the
 service to learn the tone of their customers' communications and to respond to each customer appropriately, or to
 understand and improve their customer conversations.
 **Note:** Request logging is disabled for the Tone Analyzer service. Regardless of whether you set the
 `X-Watson-Learning-Opt-Out` request header, the service does not log or retain data from requests and responses.
 */
public class ToneAnalyzer {

    /// The base URL to use when contacting the service.
    public var serviceURL: String? = "https://api.us-south.tone-analyzer.watson.cloud.ibm.com"

    /// Release date of the version of the API you want to use. Specify dates in YYYY-MM-DD format. The current version
    /// is `2017-09-21`.
    public var version: String

    /// Service identifiers
    public static let defaultServiceName = "tone_analyzer"
    // Service info for SDK headers
    internal let serviceName = defaultServiceName
    internal let serviceVersion = "v3"
    internal let serviceSdkName = "tone_analyzer"

    /// The default HTTP headers for all requests to the service.
    public var defaultHeaders = [String: String]()

    var session = URLSession(configuration: URLSessionConfiguration.default)
    public let authenticator: Authenticator

    #if os(Linux)
    /**
     Create a `ToneAnalyzer` object.

     If an authenticator is not supplied, the initializer will retrieve credentials from the environment or
     a local credentials file and construct an appropriate authenticator using these credentials.
     The credentials file can be downloaded from your service instance on IBM Cloud as ibm-credentials.env.
     Make sure to add the credentials file to your project so that it can be loaded at runtime.

     If an authenticator is not supplied and credentials are not available in the environment or a local
     credentials file, initialization will fail by throwing an exception.
     In that case, try another initializer that directly passes in the credentials.

     - parameter version: Release date of the version of the API you want to use. Specify dates in YYYY-MM-DD format.
       The current version is `2017-09-21`.
     - parameter authenticator: The Authenticator object used to authenticate requests to the service
     - serviceName: String = defaultServiceName
     */
    public init(version: String, authenticator: Authenticator? = nil, serviceName: String = defaultServiceName) throws {
        self.version = version
        self.authenticator = try authenticator ?? ConfigBasedAuthenticatorFactory.getAuthenticator(credentialPrefix: serviceName)
        if let serviceURL = CredentialUtils.getServiceURL(credentialPrefix: serviceName) {
            self.serviceURL = serviceURL
        }
        RestRequest.userAgent = Shared.userAgent
    }
    #else
    /**
     Create a `ToneAnalyzer` object.

     - parameter version: Release date of the version of the API you want to use. Specify dates in YYYY-MM-DD format.
       The current version is `2017-09-21`.
     - parameter authenticator: The Authenticator object used to authenticate requests to the service
     */
    public init(version: String, authenticator: Authenticator) {
        self.version = version
        self.authenticator = authenticator
        RestRequest.userAgent = Shared.userAgent
    }
    #endif

    #if !os(Linux)
    /**
      Allow network requests to a server without verification of the server certificate.
      **IMPORTANT**: This should ONLY be used if truly intended, as it is unsafe otherwise.
     */
    public func disableSSLVerification() {
        session = InsecureConnection.session()
    }
    #endif

    /**
     Use the HTTP response and data received by the Tone Analyzer service to extract
     information about the error that occurred.

     - parameter data: Raw data returned by the service that may represent an error.
     - parameter response: the URL response returned by the service.
     */
    func errorResponseDecoder(data: Data, response: HTTPURLResponse) -> RestError {

        let statusCode = response.statusCode
        var errorMessage: String?
        var metadata = [String: Any]()

        do {
            let json = try JSON.decoder.decode([String: JSON].self, from: data)
            metadata["response"] = json
            if case let .some(.array(errors)) = json["errors"],
                case let .some(.object(error)) = errors.first,
                case let .some(.string(message)) = error["message"] {
                errorMessage = message
            } else if case let .some(.string(message)) = json["error"] {
                errorMessage = message
            } else if case let .some(.string(message)) = json["message"] {
                errorMessage = message
            } else {
                errorMessage = HTTPURLResponse.localizedString(forStatusCode: response.statusCode)
            }
        } catch {
            metadata["response"] = data
            errorMessage = HTTPURLResponse.localizedString(forStatusCode: response.statusCode)
        }

        return RestError.http(statusCode: statusCode, message: errorMessage, metadata: metadata)
    }

    /**
     Analyze general tone.

     Use the general-purpose endpoint to analyze the tone of your input content. The service analyzes the content for
     emotional and language tones. The method always analyzes the tone of the full document; by default, it also
     analyzes the tone of each individual sentence of the content.
     You can submit no more than 128 KB of total input content and no more than 1000 individual sentences in JSON, plain
     text, or HTML format. The service analyzes the first 1000 sentences for document-level analysis and only the first
     100 sentences for sentence-level analysis.
     Per the JSON specification, the default character encoding for JSON content is effectively always UTF-8; per the
     HTTP specification, the default encoding for plain text and HTML is ISO-8859-1 (effectively, the ASCII character
     set). When specifying a content type of plain text or HTML, include the `charset` parameter to indicate the
     character encoding of the input text; for example: `Content-Type: text/plain;charset=utf-8`. For `text/html`, the
     service removes HTML tags and analyzes only the textual content.
     **See also:** [Using the general-purpose
     endpoint](https://cloud.ibm.com/docs/tone-analyzer?topic=tone-analyzer-utgpe#utgpe).

     - parameter toneContent: JSON, plain text, or HTML input that contains the content to be analyzed. For JSON
       input, provide an object of type `ToneInput`.
     - parameter sentences: Indicates whether the service is to return an analysis of each individual sentence in
       addition to its analysis of the full document. If `true` (the default), the service returns results for each
       sentence.
     - parameter tones: **`2017-09-21`:** Deprecated. The service continues to accept the parameter for
       backward-compatibility, but the parameter no longer affects the response.
       **`2016-05-19`:** A comma-separated list of tones for which the service is to return its analysis of the input;
       the indicated tones apply both to the full document and to individual sentences of the document. You can specify
       one or more of the valid values. Omit the parameter to request results for all three tones.
     - parameter contentLanguage: The language of the input text for the request: English or French. Regional variants
       are treated as their parent language; for example, `en-US` is interpreted as `en`. The input content must match
       the specified language. Do not submit content that contains both languages. You can use different languages for
       **Content-Language** and **Accept-Language**.
       * **`2017-09-21`:** Accepts `en` or `fr`.
       * **`2016-05-19`:** Accepts only `en`.
     - parameter acceptLanguage: The desired language of the response. For two-character arguments, regional variants
       are treated as their parent language; for example, `en-US` is interpreted as `en`. You can use different
       languages for **Content-Language** and **Accept-Language**.
     - parameter headers: A dictionary of request headers to be sent with this request.
     - parameter completionHandler: A function executed when the request completes with a successful result or error
     */
    public func tone(
        toneContent: ToneContent,
        sentences: Bool? = nil,
        tones: [String]? = nil,
        contentLanguage: String? = nil,
        acceptLanguage: String? = nil,
        headers: [String: String]? = nil,
        completionHandler: @escaping (WatsonResponse<ToneAnalysis>?, WatsonError?) -> Void)
    {
        guard let body = toneContent.content else {
            completionHandler(nil, RestError.serialization(values: "request body"))
            return
        }

        // construct header parameters
        var headerParameters = defaultHeaders
        let sdkHeaders = Shared.getSDKHeaders(serviceName: serviceName, serviceVersion: serviceVersion, methodName: "tone")
        headerParameters.merge(sdkHeaders) { (_, new) in new }
        headerParameters["Accept"] = "application/json"
        headerParameters["Content-Type"] = toneContent.contentType
        if let contentLanguage = contentLanguage {
            headerParameters["Content-Language"] = contentLanguage
        }
        if let acceptLanguage = acceptLanguage {
            headerParameters["Accept-Language"] = acceptLanguage
        }
        if let headers = headers {
            headerParameters.merge(headers) { (_, new) in new }
        }

        // construct query parameters
        var queryParameters = [URLQueryItem]()
        queryParameters.append(URLQueryItem(name: "version", value: version))
        if let sentences = sentences {
            let queryParameter = URLQueryItem(name: "sentences", value: "\(sentences)")
            queryParameters.append(queryParameter)
        }
        if let tones = tones {
            let queryParameter = URLQueryItem(name: "tones", value: tones.joined(separator: ","))
            queryParameters.append(queryParameter)
        }

        // construct REST request

        // ensure that serviceURL is set
        guard let serviceEndpoint = serviceURL else {
            completionHandler(nil, RestError.noEndpoint)
            return
        }

        let request = RestRequest(
            session: session,
            authenticator: authenticator,
            errorResponseDecoder: errorResponseDecoder,
            method: "POST",
            url: serviceEndpoint + "/v3/tone",
            headerParameters: headerParameters,
            queryItems: queryParameters,
            messageBody: body
        )

        // execute REST request
        request.responseObject(completionHandler: completionHandler)
    }

    /**
     Analyze customer-engagement tone.

     Use the customer-engagement endpoint to analyze the tone of customer service and customer support conversations.
     For each utterance of a conversation, the method reports the most prevalent subset of the following seven tones:
     sad, frustrated, satisfied, excited, polite, impolite, and sympathetic.
     If you submit more than 50 utterances, the service returns a warning for the overall content and analyzes only the
     first 50 utterances. If you submit a single utterance that contains more than 500 characters, the service returns
     an error for that utterance and does not analyze the utterance. The request fails if all utterances have more than
     500 characters. Per the JSON specification, the default character encoding for JSON content is effectively always
     UTF-8.
     **See also:** [Using the customer-engagement
     endpoint](https://cloud.ibm.com/docs/tone-analyzer?topic=tone-analyzer-utco#utco).

     - parameter utterances: An array of `Utterance` objects that provides the input content that the service is to
       analyze.
     - parameter contentLanguage: The language of the input text for the request: English or French. Regional variants
       are treated as their parent language; for example, `en-US` is interpreted as `en`. The input content must match
       the specified language. Do not submit content that contains both languages. You can use different languages for
       **Content-Language** and **Accept-Language**.
       * **`2017-09-21`:** Accepts `en` or `fr`.
       * **`2016-05-19`:** Accepts only `en`.
     - parameter acceptLanguage: The desired language of the response. For two-character arguments, regional variants
       are treated as their parent language; for example, `en-US` is interpreted as `en`. You can use different
       languages for **Content-Language** and **Accept-Language**.
     - parameter headers: A dictionary of request headers to be sent with this request.
     - parameter completionHandler: A function executed when the request completes with a successful result or error
     */
    public func toneChat(
        utterances: [Utterance],
        contentLanguage: String? = nil,
        acceptLanguage: String? = nil,
        headers: [String: String]? = nil,
        completionHandler: @escaping (WatsonResponse<UtteranceAnalyses>?, WatsonError?) -> Void)
    {
        // construct body
        let toneChatRequest = ToneChatRequest(
            utterances: utterances)
        guard let body = try? JSON.encoder.encode(toneChatRequest) else {
            completionHandler(nil, RestError.serialization(values: "request body"))
            return
        }

        // construct header parameters
        var headerParameters = defaultHeaders
        let sdkHeaders = Shared.getSDKHeaders(serviceName: serviceName, serviceVersion: serviceVersion, methodName: "toneChat")
        headerParameters.merge(sdkHeaders) { (_, new) in new }
        headerParameters["Accept"] = "application/json"
        headerParameters["Content-Type"] = "application/json"
        if let contentLanguage = contentLanguage {
            headerParameters["Content-Language"] = contentLanguage
        }
        if let acceptLanguage = acceptLanguage {
            headerParameters["Accept-Language"] = acceptLanguage
        }
        if let headers = headers {
            headerParameters.merge(headers) { (_, new) in new }
        }

        // construct query parameters
        var queryParameters = [URLQueryItem]()
        queryParameters.append(URLQueryItem(name: "version", value: version))

        // construct REST request

        // ensure that serviceURL is set
        guard let serviceEndpoint = serviceURL else {
            completionHandler(nil, RestError.noEndpoint)
            return
        }

        let request = RestRequest(
            session: session,
            authenticator: authenticator,
            errorResponseDecoder: errorResponseDecoder,
            method: "POST",
            url: serviceEndpoint + "/v3/tone_chat",
            headerParameters: headerParameters,
            queryItems: queryParameters,
            messageBody: body
        )

        // execute REST request
        request.responseObject(completionHandler: completionHandler)
    }

    // Private struct for the toneChat request body
    private struct ToneChatRequest: Encodable {
        // swiftlint:disable identifier_name
        let utterances: [Utterance]
        // swiftlint:enable identifier_name
    }

}

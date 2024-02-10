//
//  ServiceRouter.swift
//  MovieInfo
//
//  Created by Erick Valdez on 9/02/24.
//

import Foundation
import Alamofire

enum ServiceRouter {
    case movies
    
    var baseURL: URL {
        switch self {
        case .movies:
            URL(string: TempConstants.baseURL)!
        }
    }
    
    var path: String {
        switch self {
        case .movies:
            return "/movie/upcoming"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .movies:
            return .get
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .movies:
            return ["language":"es-PER"]
        }
    }
    
    var headers: HTTPHeaders {
        return [.authorization(bearerToken: TempConstants.apiKey)]
    }
}

extension ServiceRouter: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        
        var request = URLRequest(url: url)
        
        request.method = method
        request.headers = headers
        
        request = try URLEncodedFormParameterEncoder(destination: .methodDependent).encode(parameters, into: request)
        
        return request
    }
    
    static let sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.waitsForConnectivity = true
        let interceptor = ServiceInterceptor()
        return Session(configuration: configuration, eventMonitors: [interceptor])
    }()
}

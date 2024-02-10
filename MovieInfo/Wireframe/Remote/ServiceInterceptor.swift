//
//  ServiceInterceptor.swift
//  MovieInfo
//
//  Created by Erick Valdez on 9/02/24.
//

import Foundation
import Alamofire

class ServiceInterceptor: EventMonitor {
    func requestDidFinish(_ request: Request) {
        guard let url = request.request?.url?.absoluteString else { return }
        guard let method = request.request?.httpMethod else { return }
        guard let statusCode = request.response?.statusCode else { return }
        
        print("MovieAPP_Logger: \(url) - \(method) - \(statusCode)")
    }
}

//
//  Connectivity.swift
//  MovieInfo
//
//  Created by Erick Valdez on 13/02/24.
//

import Alamofire

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}

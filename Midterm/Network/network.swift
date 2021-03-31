//
//  File.swift
//  NetworkCallPromises
//
//  Created by GeFrank on 3/3/21.
//

import Foundation
import Alamofire
import PromiseKit
import SwiftyJSON

class CovidDataNetwork {
    public func promiseRequest() -> Promise<[CovidData]>{
        let fullUrl = Constants.apiEndPoint
        return Promise<[CovidData]> { seal -> Void in

            AF.request(fullUrl).responseJSON { response in
                
                if response.error == nil {
                    guard let data = response.data else {return seal.fulfill([CovidData]())}
                    guard let responseData = JSON(data).array else {return seal.fulfill([CovidData]())}
                    
                    if responseData.count == 0 {
                        return
                    }
                    
                    var covidData: [CovidData] = []
                    for responseDict in responseData {
                        let state = responseDict["state"].stringValue
                        let positive = responseDict["positive"].intValue
                        let total = responseDict["total"].intValue
                        let covidDataObject = CovidData(state: state, positiveCases: positive, totalTests: total)
                        covidData.append(covidDataObject)
                    }
                    seal.fulfill(covidData)

                } else {
                    seal.reject(response.error! )
                }
            }
        }
    }
}


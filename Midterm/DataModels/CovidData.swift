//
//  CovidData.swift
//  Midterm
//
//  Created by GeFrank on 3/30/21.
//

import Foundation

class CovidData {
    var state: String
    var positiveCases: Int
    var totalTests: Int
    
    init (state: String, positiveCases: Int, totalTests: Int) {
        self.state = state
        self.positiveCases = positiveCases
        self.totalTests = totalTests
    }
}

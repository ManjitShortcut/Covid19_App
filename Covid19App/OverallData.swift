
//
//  OverallData.swift
//  Covid19App
//
//  Created by Manjit on 28/05/2020.
//  Copyright © 2020 Covid19App. All rights reserved.
//

import Foundation

struct OverallData: Codable, Equatable,Identifiable {
    let id =  UUID()
    let cases: Int
    let todayCases: Int
    let deaths: Int
    let todayDeaths: Int
    let recovered: Int
    let active: Int
    let critical: Int
    let casesPerOneMillion: Int
//    let deathsPerOneMillion: Double?
//    let tests: Double?
//    let testsPerOneMillion: Double?
//    let population: Double?
//    let activePerOneMillion: Double?
//    let recoveredPerOneMillion: Double?
//    let criticalPerOneMillion: Double?
//    let affectedCountries: Double?
    
}

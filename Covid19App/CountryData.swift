//
//  CountryData.swift
//  Covid19App
//
//  Created by Manjit on 28/05/2020.
//  Copyright © 2020 Covid19App. All rights reserved.
//

import Foundation

struct CountryData: Codable, Identifiable, Equatable, Hashable {
    let id = UUID()
    let cases: Int32
//    let todayCases: UInt?
//    let todayDeath: UInt?
    let recovered: Int32
    let active: Int32
    let deaths: Int32
    let country: String
    let critical: Int32
//    let casesPerOneMillion: UInt!
//    let deathsPerOneMillion: UInt!
//    let tests: Int!
//    let testsPerOneMillion: UInt!
//    let population: UInt!
//    let activePerOneMillion: Double?
//    let recoveredPerOneMillion: Double?
//    let criticalPerOneMillion: Double?
//    let affectedCountries: Double?
}

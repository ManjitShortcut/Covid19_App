//
//  AllcountryViewModel.swift
//  Covid19App
//
//  Created by Manjit on 28/05/2020.
//  Copyright © 2020 Covid19App. All rights reserved.
//

import Foundation

class AllCpountryViewModel : ObservableObject {

    @Published var overallCountryList = [CountryData]()
    init() {
        self.fetchAllCountryData()
    }
    func fetchAllCountryData() {
        Network().fetch(url: "https://disease.sh/v2/countries?sort=cases&allowNull=false") { (response: Result<[CountryData], Error>) in
            switch response {
            case .failure(let error):
                print(error)
            case .success(let res):
                DispatchQueue.main.async {
                self.overallCountryList = res
                }
                
            }
        }
    }
}

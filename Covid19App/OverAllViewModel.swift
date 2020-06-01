//
//  OverAllViewModel.swift
//  Covid19App
//
//  Created by Manjit on 28/05/2020.
//  Copyright © 2020 Covid19App. All rights reserved.
//

import Foundation

class OverAllViewModel: ObservableObject {

    @Published var overAllData: OverallData!
    init(){
        self.getOverralInformation()
    }
    func getOverralInformation(){
        Network().fetch(url: "https://disease.sh/v2/all") { (response: Result<OverallData, Error>) in
            switch response {
            case .failure(let error):
                print(error)
            case .success(let res):
                DispatchQueue.main.async {
                self.overAllData = res
                }
                
            }
        }
    }
}

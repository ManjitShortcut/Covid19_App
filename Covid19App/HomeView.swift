//
//  HomeView.swift
//  Covid19App
//
//  Created by Manjit on 28/05/2020.
//  Copyright © 2020 Covid19App. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var overAllviewModel = OverAllViewModel()
    @ObservedObject var countryViewModel = AllCpountryViewModel()
    
    var body: some View {
        VStack() {
            if overAllviewModel.overAllData != nil {
                VStack {
                    HStack(alignment:.top) {
                        VStack(alignment:.leading, spacing: 10) {
                            Text("March").foregroundColor(Color.white).fontWeight(.semibold).font(.footnote)
                            Text("Covid 19- case").foregroundColor(Color.white).font(.subheadline).fontWeight(.semibold)
                            Text("\(overAllviewModel.overAllData.cases)").foregroundColor(Color.white).fontWeight(.bold).font(.title)
                        }
                        Spacer()
                        Button(action: {
                            self.refesh()
                        }) {
                            Image(systemName:"arrow.clockwise").foregroundColor(.white)
                        }
                    }.padding(.bottom,80).padding(.top,30).padding().background(Color.red)
                    VStack(spacing: 15){
                        HStack(spacing: 10) {
                            VStack(spacing:15) {
                                Text("Death")
                                Text("\(overAllviewModel.overAllData.deaths)").foregroundColor(Color.red).fontWeight(.bold)
                            }.padding(15).background(Color.white).cornerRadius(5).shadow(radius: 6)
                            
                            VStack(spacing:15) {
                                Text("Recoverd")
                                Text("\(overAllviewModel.overAllData.recovered)").foregroundColor(Color.yellow).fontWeight(.bold)
                            }.padding(15).background(Color.white).cornerRadius(5).shadow(radius: 6)
                        }
                        VStack(spacing:15) {
                            Text("Active Case")
                            Text("\(overAllviewModel.overAllData.active)").foregroundColor(Color.green).fontWeight(.bold)
                        }.padding(15).background(Color.white).cornerRadius(5).shadow(radius: 6)
                    }.offset( y: -50).zIndex(50)
                    if countryViewModel.overallCountryList.count>0 {
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 20) {
                                ForEach(0..<countryViewModel.overallCountryList.count,id: \.self) {item in
                                    GeometryReader{ gemerty in
                                        CellView(item: self.countryViewModel.overallCountryList[item]).rotation3DEffect(Angle(degrees: Double((gemerty.frame(in: .global).minX) / -20)), axis: (x: 0, y: 10.0, z: 0))
                                    }.frame(width: UIScreen.main.bounds.width-25)
                                    
                                }.padding()
                                
                            }
                        }
                    }
                }
                Spacer()

            } else{
                VStack(spacing:15) {
                    Text("Loading data")
                    ActivityIndiicatorWrapper()
                    }.padding(20).cornerRadius(15).background(Color.white).shadow(radius: 15)
            }
        }.edgesIgnoringSafeArea(.top).background(Color.black.opacity(0.1).edgesIgnoringSafeArea(.all))
    }
    
    func refesh() {
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



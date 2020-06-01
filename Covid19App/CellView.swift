//
//  ScrollCellView.swift
//  Covid19App
//
//  Created by Manjit on 28/05/2020.
//  Copyright © 2020 Covid19App. All rights reserved.
//

import SwiftUI

struct CellView: View {
    let item : CountryData
    var body : some View {
        VStack(alignment: .leading) {
            Text(item.country)
            HStack(spacing: 15){
                VStack(alignment:.leading,spacing: 5){
                    Text("Active Case")
                    Text("\(item.active)").font(.headline)
                }
                VStack(alignment:.leading){
                    VStack(alignment:.leading,spacing: 5){
                        Text("Death").font(.body).fontWeight(.semibold)
                        Text("\(item.deaths)").foregroundColor(Color.red).font(.headline).fontWeight(.bold)
                    }
                    Divider()
                    VStack(alignment:.leading,spacing: 5 ){
                        Text("Recovered").font(.body).fontWeight(.semibold)
                        Text("\(item.recovered)").foregroundColor(.green).fontWeight(.bold)
                    }
                    Divider()
                    VStack(alignment:.leading,spacing: 5){
                        Text("Critical").font(.body).fontWeight(.semibold)
                        Text("\(item.critical)").foregroundColor(Color.yellow).fontWeight(.bold)

                    }
                }
            }
            }.padding().background(Color.white).cornerRadius(15)
    }
}
//struct CellView_Previews: PreviewProvider {
//    static var previews: some View {
//        CellView(item: CountryData(from: <#Decoder#>))
//    }
//}

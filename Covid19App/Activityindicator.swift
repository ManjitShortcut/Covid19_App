//
//  Activityindicator.swift
//  Covid19App
//
//  Created by Manjit on 01/06/2020.
//  Copyright © 2020 Covid19App. All rights reserved.
//

import Foundation
import  SwiftUI

struct ActivityIndiicatorWrapper: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<ActivityIndiicatorWrapper>) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .large
        activityIndicator.startAnimating()
        return activityIndicator
    }
    
   
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
   
    
}

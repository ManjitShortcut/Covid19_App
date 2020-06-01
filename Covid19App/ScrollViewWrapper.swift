//
//  ScrollViewWrapper.swift
//  Covid19App
//
//  Created by Manjit on 01/06/2020.
//  Copyright © 2020 Covid19App. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct ScrollViewWrapper: UIViewRepresentable {
    @Binding var selection: Date

    func updateUIView(_ uiView: UIScrollView, context: UIViewRepresentableContext<ScrollViewWrapper>) {
    
    }
    func makeUIView(context: UIViewRepresentableContext<ScrollViewWrapper>) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled =  true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
       return scrollView
    }

}

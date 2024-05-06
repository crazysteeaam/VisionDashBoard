//
//  HomePageView.swift
//  VisionDashBoard
//
//  Created by 徐政杰 on 2024/5/6.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        GeometryReader { geometry in
            HStack{
                LeftArea()                
                RightArea()
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    HomePageView()
}

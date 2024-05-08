//
//  ContentView.swift
//  VisionDashBoard
//
//  Created by 徐政杰 on 2024/4/29.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct LegendIndicator: View {
    var color: Color
    var text: String

    var body: some View {
        HStack {
            Circle()
                .fill(color)
                .frame(width: 20, height: 20)
            Text(text)
                .foregroundColor(.white)
                .font(.system(size:30))
        }
    }
}

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 20) {
                Text("我的督办项")
                    .font(.system(size: geometry.size.width > 1000 ? 50 : 35))
                    .bold()
                    .padding(.bottom, 30)
                
                VStack(alignment: .center, spacing: 0){
                    Model3D(named: "PieChart", bundle: realityKitContentBundle)
                        .padding(.bottom, 70)
                    
                    HStack() {
                        // Legend for "流程中"
                        LegendIndicator(color: Color.green, text: "流程中")
                        
                        // Legend for "已超时"
                        LegendIndicator(color: Color.red, text: "已超时")
                    }
                    .padding()
                }
                .frame(width: geometry.size.width)
                
            }
            .padding()
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

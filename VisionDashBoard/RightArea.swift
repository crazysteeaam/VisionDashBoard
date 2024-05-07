//
//  RightArea.swift
//  VisionDashBoard
//
//  Created by 徐政杰 on 2024/5/6.
//

import SwiftUI

struct RightArea: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    TaskView()
                            .background(.ultraThinMaterial)
                            .frame(width: geometry.size.width * 0.46, height: geometry.size.height * 0.3)
                            .cornerRadius(40)
                            .padding(20)
                    TaskView()
                            .background(.ultraThinMaterial)
                            .frame(width: geometry.size.width * 0.46, height: geometry.size.height * 0.3)
                            .cornerRadius(40)
                            .padding(20)
                }
                ContentView()
                        .background(.ultraThinMaterial)
                        .frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.6)
                        .cornerRadius(40)
                        .padding(20)
            }
                    .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}


#Preview(windowStyle: .automatic) {
    RightArea()
}

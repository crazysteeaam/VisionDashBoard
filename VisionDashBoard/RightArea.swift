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
                    PPView()
                            .background(.ultraThinMaterial)
                            .frame(width: geometry.size.width * 0.46, height: geometry.size.height * 0.4)
                            .cornerRadius(40)
                            .padding(10)
                    FRRView()
                            .background(.ultraThinMaterial)
                            .frame(width: geometry.size.width * 0.46, height: geometry.size.height * 0.4)
                            .cornerRadius(40)
                            .padding(10)
                }
                ContentView()
                        .background(.ultraThinMaterial)
                        .frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.5)
                        .cornerRadius(40)
                        .padding(10)
            }
                    .onAppear {
                        print("RightArea Width: \(geometry.size.width)")
                        print("RightArea Height: \(geometry.size.height)")
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}


#Preview(windowStyle: .automatic) {
    RightArea()
}

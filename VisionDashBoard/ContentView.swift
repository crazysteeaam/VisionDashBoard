//
//  ContentView.swift
//  VisionDashBoard
//
//  Created by 徐政杰 on 2024/4/29.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)

            Text("Hello, wdworld!")
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

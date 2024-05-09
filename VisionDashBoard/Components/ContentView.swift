//
//  ContentView.swift
//  VisionDashBoard
//
//  Created by 徐政杰 on 2024/4/29.
//

import SwiftUI
import RealityKit
import RealityKitContent

private let modelDepth: Double = 60

private enum Item: String, CaseIterable, Identifiable {
    case PieChartblue1, PieChartblue2
    var id: Self {
        self
    }
    var name: String {
        rawValue
    }
}

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 20) {
                Text("配套率")
                        .font(.system(size: geometry.size.width > 1000 ? 50 : 25))
                        .bold()
                        .padding()
                        .padding(.leading, 20)

                HStack(alignment: .center, spacing: 0) {
                    VStack {
                        ItemView(item: .PieChartblue1, orientation: [2.3, 0, 0])
                                .dragRotation(yawLimit: .degrees(50), pitchLimit: .degrees(50))
                                .offset(z: modelDepth)
                                .frame(width: geometry.size.width * 0.3)
                                .padding(.bottom,geometry.size.width > 800 ? 120 :70)
                        Text("80%")
                                .font(.system(size: geometry.size.width > 800 ? 60 : 30))
                                .bold()
                        Text("日计划配套率")
                                .font(.system(size: geometry.size.width > 800 ? 50 : 20))
                                
                    }
                    .frame(width: geometry.size.width * 0.4)
                    .padding()

                    VStack {
                        ItemView(item: .PieChartblue2, orientation: [2.3, 0, 0])
                                .dragRotation(yawLimit: .degrees(50), pitchLimit: .degrees(50))
                                .offset(z: modelDepth)
                                .frame(width: geometry.size.width * 0.3)
                                .padding(.bottom,geometry.size.width > 800 ? 120 :70)
                        Text("76%")
                                .font(.system(size: geometry.size.width > 800 ? 60 : 30))
                        Text("周计划配套率")
                                .font(.system(size: geometry.size.width > 800 ? 50 : 20))
                    }
                    .padding()
                    .frame(width: geometry.size.width * 0.4)
                }
                .frame(width: geometry.size.width)

            }
//            .padding()
        }
    }
}

private struct ItemView: View {
    var item: Item
    var orientation: SIMD3<Double> = .zero

    var body: some View {
        Model3D(named: item.name, bundle: realityKitContentBundle) { model in
            model.resizable()
                    .scaledToFit()
                    .rotation3DEffect(
                            Rotation3D(
                                    eulerAngles: .init(angles: orientation, order: .xyz)
                            )
                    )
                    .frame(depth: modelDepth)
                    .offset(z: -modelDepth / 2)
                    .accessibilitySortPriority(1)
        } placeholder: {
            ProgressView()
                    .offset(z: -modelDepth * 0.75)
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

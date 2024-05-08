//
//  PlaneView.swift
//  VisionDashBoard
//
//  Created by 徐政杰 on 2024/5/8.
//

import SwiftUI
import RealityKit
import RealityKitContent

private let modelDepth: Double = 100

private enum Item: String, CaseIterable, Identifiable {
    case c919
    var id: Self { self }
    var name: String { rawValue.capitalized }
}

struct PlaneView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text("完成比例")
                    .font(.system(size: geometry.size.width > 1000 ? 50 : 35))
                    .bold()
                    .padding()
                    .padding(.bottom, 0)
                    .padding(.leading, 20)
                
                VStack(alignment: .center){
                    ItemView(item: .c919, orientation: [0, 0, -0.15])
                        .dragRotation(yawLimit: .degrees(50), pitchLimit: .degrees(50))
                        .offset(z: modelDepth)
                        .frame(width: geometry.size.width * 0.7)
                        .padding(.bottom,50)
                    
                }
                .frame(width: geometry.size.width)
                
                VStack(alignment: .center,spacing:10) {
                    Text("259架次")
                        .font(.system(size:  geometry.size.width > 1000 ? 40 : 25))
                    Text("客户：一二三航空")
                        .font(.system(size:  geometry.size.width > 1000 ? 35 : 20))
                    Text("完成比例：80%")
                        .font(.system(size:  geometry.size.width > 1000 ? 35 : 20))
                }
                .frame(width: geometry.size.width)
                
            }
            .frame(width: geometry.size.width)
        }
    }
}

/// A 3D model loaded from the app's asset bundle.
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
    PlaneView()
}

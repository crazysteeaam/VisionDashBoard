//
//  BarModel.swift
//  VisionDashBoard
//
//  Created by 徐政杰 on 2024/4/29.
//

import SwiftUI
import RealityKit
import SceneKit

struct PieChart3DView: View {
    var body: some View {
        SceneView(scene: createPieChartScene(), options: [.autoenablesDefaultLighting, .allowsCameraControl])
    }

    func createPieChartScene() -> SCNScene {
        let scene = SCNScene()
        let rootNode = scene.rootNode
        
        // 添加扇形
        let pieSlice = SCNNode(geometry: createPieSliceGeometry())
        rootNode.addChildNode(pieSlice)
        
        return scene
    }

    func createPieSliceGeometry() -> SCNGeometry {
        let pieSlice = SCNCylinder(radius: 1.0, height: 0.2)
        pieSlice.firstMaterial?.diffuse.contents = UIColor.red
        
        // SCNCylinder 是一个全圆柱，为了创造扇形的效果，我们可以通过shader或裁剪实现。
        // 但这里我们仅展示如何创建基础的圆柱，具体扇形效果需要进一步处理。

        return pieSlice
    }
}

#Preview(windowStyle: .automatic) {
    PieChart3DView()
}

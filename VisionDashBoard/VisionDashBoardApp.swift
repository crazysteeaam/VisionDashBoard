//
//  VisionDashBoardApp.swift
//  VisionDashBoard
//
//  Created by 徐政杰 on 2024/4/29.
//

import SwiftUI

@main
struct VisionDashBoardApp: App {
    @State private var model = TabViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                LeftArea()
                    .frame(minWidth: 500, minHeight: 1000)
    //                                .environment(model) // 注意这里改成environmentObject
                    .tabItem {
                        Label("Home", systemImage: "house") // 使用系统图标代表"home"标签
                    }
                
                LeftArea() // 如果火焰区域有不同的视图，您可以替换LeftArea()为那个视图
                    .frame(minWidth: 500, minHeight: 1000)
    //                                .environment(model)
                    .tabItem {
                        Label("Fire", systemImage: "flame.fill") // 使用系统图标代表"fire"标签
                    }
            }
        }
    }

}

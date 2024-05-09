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
                HomePageView()
                        //                        .frame(minWidth: 500, minHeight: 1000)
                        .tabItem {
                            Label("Home", systemImage: "house") // 使用系统图标代表"home"标签
                        }

                HomePageView()
                        //                        .frame(minWidth: 500, minHeight: 1000)
                        .tabItem {
                            Label("Fire", systemImage: "flame.fill") // 使用系统图标代表"fire"标签
                        }

                HomePageView()
                        //                        .frame(minWidth: 500, minHeight: 1000)
                        .tabItem {
                            Label("Fire", systemImage: "flame.fill") // 使用系统图标代表"fire"标签
                        }

                HomePageView()
                        //                        .frame(minWidth: 500, minHeight: 1000)
                        .tabItem {
                            Label("Fire", systemImage: "flame.fill") // 使用系统图标代表"fire"标签
                        }

                HomePageView()
                        //                        .frame(minWidth: 500, minHeight: 1000)
                        .tabItem {
                            Label("Fire", systemImage: "flame.fill") // 使用系统图标代表"fire"标签
                        }
            }
        }
    }

}

//
//  HomePageView.swift
//  VisionDashBoard
//
//  Created by 徐政杰 on 2024/5/6.
//

import SwiftUI

struct HomePageView: View {
    // 状态变量，用于控制RightArea的显示
    @State private var isRightAreaVisible = true

    var body: some View {
        GeometryReader { geometry in
            HStack {
                LeftArea()
                Button(action: {
                    // 切换RightArea的显示状态
                    withAnimation { // 添加动画
                        isRightAreaVisible.toggle()
                    }
                }) {
                    Image(systemName: "share")
                            .padding()
                }
                        .frame(width: 44, height: 44)
                if isRightAreaVisible {
                    RightArea()
                            .transition(.slide) // 使用滑动效果作为过渡动画
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    HomePageView()
}

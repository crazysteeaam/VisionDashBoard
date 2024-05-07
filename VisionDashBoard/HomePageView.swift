//
//  HomePageView.swift
//  VisionDashBoard
//
//  Created by 徐政杰 on 2024/5/6.
//

import SwiftUI

struct HomePageView: View {
    // 状态变量，用于控制RightArea的显示
    @State private var isRightAreaVisible = false

    var body: some View {
        GeometryReader { geometry in
            HStack(alignment:.center, spacing: 0) {
                LeftArea()
                    .frame(width: isRightAreaVisible ? geometry.size.width * 0.48 : geometry.size.width * 0.75)
                    .animation(.default, value: isRightAreaVisible)
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
                        .frame(width: geometry.size.width * 0.5) // Adjust the width of RightArea
                        .transition(.slide) // 使用滑动效果作为过渡动画
                }
            }
            .frame(width: geometry.size.width, alignment: .leading)
        }
    }
}

#Preview(windowStyle: .automatic) {
    HomePageView()
}

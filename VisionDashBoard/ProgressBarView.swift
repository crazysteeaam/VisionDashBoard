//
//  ProgressBarView.swift
//  VisionDashBoard
//
//  Created by 徐政杰 on 2024/4/29.
//

import SwiftUI

struct ProgressBarView: View {
    // 示例数据
    let subjects = [
        ("Web Programming", 5, 10),
        ("Data and Structures", 4, 15),
        ("Artificial Intelligence", 12, 20)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("任务详情")
                    .font(.system(size: 62))
                    .padding(.bottom, 30)
            ForEach(subjects, id: \.0) { subject in
                Text(subject.0)
                        .font(.system(size: 35, weight: .bold, design: .rounded))
                        .frame(width: 400, alignment: .leading) // Ensure the frame is wide enough
                ProgressView(value: Float(subject.1), total: Float(subject.2)) {
                }
                        .progressViewStyle(LinearProgressViewStyle(tint: Color.green))
                        .scaleEffect(x: 1, y: 2, anchor: .center) // 调整进度条高度
//                        .rotation3DEffect(.degrees(30), axis: (x: 1.0, y: 0.0, z: 0.0)) // 3D旋转效果
//                        .shadow(color: .gray, radius: 2, x: 0, y: 2) // 添加阴影以增强3D效果
                Text("\(subject.1)/\(subject.2)")
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
                .padding()
                .cornerRadius(25)
                .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ProgressBarView()
}

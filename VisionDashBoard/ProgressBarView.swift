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
//        ("AO：265 225A03CW7050.01","前货舱右侧甚高频导航接收机支架的安装", 5, 7),
        ("AO:264,221A403AA0020","驾驶舱俯仰伺服机构的安装", 4, 6),
        ("AO:263,213A206FS0120","后设备舱门修配", 1, 1),
        ("AO:265,211A204AS0145","地板左上方带板安装", 1, 6)
    ]

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 20) {
                Text("任务详情")
                    .font(.system(size: geometry.size.width > 1000 ? 50 : 35))
                    .bold()
                    .padding(.bottom, 0)
                ForEach(subjects, id: \.0) { subject in
                    Text(subject.0)
                            .font(.system(size: geometry.size.width > 700 ? 30 : 15, design: .rounded))
                            .frame(width: geometry.size.width, alignment: .leading) // Ensure the frame is wide enough
                    Text("\(subject.1) \(subject.2)/\(subject.3)")
                            .font(.system(size: geometry.size.width > 700 ? 33 : 17, weight: .bold, design: .rounded))
                            .padding(.top,-14)
                            .frame(width: geometry.size.width, alignment: .leading) // Ensure the frame is wide enough
                    ProgressView(value: Float(subject.2), total: Float(subject.3)) {
                    }
                            .padding(.top,-5)
                            .progressViewStyle(LinearProgressViewStyle(tint: Color.green))
                            .scaleEffect(x: 1, y: 2, anchor: .center) // 调整进度条高度
//                    Text()
//                            .font(.system(size: 25, weight: .bold, design: .rounded))
//                            .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
            }
//                    .onAppear {
//                        print("ProgressBar Width: \(geometry.size.width)")
//                        print("ProgressBar Height: \(geometry.size.height)")
//                    }
//                    .onChange(of: geometry.size.width) {
//                        print("ProgressBar Width: \(geometry.size.width)")
//                    }
//                    .onChange(of: geometry.size.height) {
//                        print("ProgressBar Height: \(geometry.size.height)")
//                    }
                    .padding()
        }
    }
}

#Preview(windowStyle: .automatic) {
    ProgressBarView()
}

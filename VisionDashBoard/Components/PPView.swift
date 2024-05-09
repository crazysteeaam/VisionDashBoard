//
//  PPView.swift
//  VisionDashBoard
//
//  Created by 徐政杰 on 2024/5/9.
//

import SwiftUI

struct PPView: View {
    let subjects = [
        ("所处节拍天数/当前所处节拍天数",37,255),
        ("当周周计划完成率",56,100),
        ("当周周计划偏离率",0,100),
        ("当周节拍归档比例",82,100)
    ]
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading){
                Text("生产计划")
                    .font(.system(size: geometry.size.width > 1000 ? 50 : 25))
                    .bold()
                    .padding()
                    .padding(.bottom, 0)
                    .padding(.leading, 20)
                ScrollView{
                    ForEach(subjects, id: \.0) { subject in
                        LineView(subject:subject)
                            .frame(width: geometry.size.width * 0.90,height:geometry.size.width > 1000 ? 50 : 35)
                            .padding()
                    }
                }
                .padding(5)
                .padding(.top,-10)
            }
            
        }
    }
}


private struct LineView : View {
    let subject:(String,Int,Int)
    var body: some View {
        GeometryReader { geometry in
            VStack{
                Text(subject.0)
                    .font(.system(size: geometry.size.width > 700 ? 33 : 17, weight: .bold, design: .rounded))
                    .frame(width: geometry.size.width, alignment: .leading) // Ensure the frame is wide enough
                    .padding(.bottom,5)
                ProgressView(value: Float(subject.1), total: Float(subject.2)) {
                }
                .padding(.top,-5)
                .progressViewStyle(LinearProgressViewStyle(tint: Color.blue))
                .scaleEffect(x: 1, y: 2, anchor: .center) // 调整进度条高度
                Text("\(subject.1) /\(subject.2)")
                    .font(.system(size: geometry.size.width > 700 ? 25 : 15, weight: .bold, design: .rounded))
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .frame(width: geometry.size.width)
        }
    }
}

#Preview(windowStyle: .automatic) {
    PPView()
}

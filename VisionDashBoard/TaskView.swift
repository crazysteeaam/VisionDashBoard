//
//  TaskView.swift
//  VisionDashBoard
//
//  Created by 徐政杰 on 2024/5/6.
//

import SwiftUI

struct TaskView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Image("task")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding(.leading, 10)

                    VStack(alignment: .leading, spacing: 5) {
                        Text("文档归档截止提醒督办")
                                .font(.headline)
                        Text("当前环节：需求部门领导审批")
                                .font(.subheadline)
                        Text("处理人员：张三")
                                .font(.subheadline)
                        Text("发起人员：赵四")
                                .font(.subheadline)
                        Text("待审核")
                                .font(.subheadline)
                                .foregroundColor(.yellow) // Set the text color
                                .padding(10) // Add some padding around the text
                                .overlay(
                                        RoundedRectangle(cornerRadius: 3) // Define the shape of the border
                                                .stroke(.yellow, lineWidth: 1)
                                                .frame(width: 55, height: 25)
                                )
                    }
                            .padding(.leading, 10)

                    Spacer()
                }
                        .padding(.top, 10)


                HStack {
                    Text("已用时: 23h56min")
                            .font(.caption)
                    Spacer()

                    Button(action: {
                        print("确认按钮被点击")
                    }) {
                        Image(systemName: "message")
                                .padding()
                    }
                            .frame(width: 44, height: 44)
                    Button(action: {
                        print("Share button tapped")
                    }) {
                        Image(systemName: "square.and.arrow.up")
                                .padding()
                    }
                            .frame(width: 44, height: 44)
                    Button(action: {
                        print("Favorite button tapped")
                    }) {
                        Image(systemName: "star")
                                .padding()
                    }
                            .frame(width: 44, height: 44)
                }
                        .padding(.horizontal, 10)
            }
                    .cornerRadius(10)
                    .padding(.all, 10)
                    .shadow(radius: 5)
        }
    }
}

#Preview(windowStyle: .automatic) {
    TaskView()
}

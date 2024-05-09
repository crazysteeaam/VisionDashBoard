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
                            .font(.system(size: geometry.size.width > 800 ? 50 : 15))
                        Text("当前环节：需求部门领导审批")
                            .font(.system(size: geometry.size.width > 800 ? 35 : 15))
                        Text("处理人员：张三")
                            .font(.system(size: geometry.size.width > 800 ? 35 : 15))
                        Text("发起人员：赵四")
                            .font(.system(size: geometry.size.width > 800 ? 35 : 15))
                        Text("待审核")
                            .font(.system(size: geometry.size.width > 800 ? 35 : 15))
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
                        .font(.system(size: geometry.size.width > 800 ? 40 : 15))
                    Spacer()

                    Button(action: {
                        print("确认按钮被点击")
                        print("TaskView Width: \(geometry.size.width)")
                        print("TaskView Height: \(geometry.size.height)")
                    }) {
                        Image(systemName: "message")
                                .padding()
                    }
                    .frame(width: geometry.size.width > 800 ? 88 : 44, height: geometry.size.width > 800 ? 88 : 44)
                    .padding()
                    Button(action: {
                        print("Share button tapped")
                    }) {
                        Image(systemName: "square.and.arrow.up")
                                .padding()
                    }
                    .frame(width: geometry.size.width > 800 ? 88 : 44, height: geometry.size.width > 800 ? 88 : 44)
                    .padding()
                    Button(action: {
                        print("Favorite button tapped")
                    }) {
                        Image(systemName: "star")
                                .padding()
                    }
                    .frame(width: geometry.size.width > 800 ? 88 : 44, height: geometry.size.width > 800 ? 88 : 44)
                    .padding()
                }
                        .padding(.horizontal, 10)
            }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .onAppear {
                        print("TaskView Width: \(geometry.size.width)")
                        print("TaskView Height: \(geometry.size.height)")
                    }
                    .cornerRadius(10)
                    .padding(.all, 30)
                    .shadow(radius: 5)
        }
    }
}

#Preview(windowStyle: .automatic) {
    TaskView()
}

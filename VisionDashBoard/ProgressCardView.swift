//
//  ProgressCardView.swift
//  VisionDashBoard
//
//  Created by 徐政杰 on 2024/4/29.
//

import SwiftUI

// 业务图

// 示例数据
let businessDetailTitle = "业务详情"
let dateRange = "January - June 2021"

struct StatisticData {
    var iconColor: Color
    var title: String
    var value: String
}

//let statistics = [
//    StatisticData(iconColor: .blue, title: "Absence", value: "90%"),
//    StatisticData(iconColor: .green, title: "Tasks & Exam", value: "70%"),
//    StatisticData(iconColor: .orange, title: "Quiz", value: "85%")
//]


// A simple dashboard view with a progress ring and some statistics
struct ProgressCardView: View {
    var statistics = [
        StatisticData(iconColor: .blue, title: "Absence", value: "90%"),
        StatisticData(iconColor: .green, title: "Tasks & Exam", value: "70%"),
        StatisticData(iconColor: .orange, title: "Quiz", value: "85%")
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.systemBackground)
                        .edgesIgnoringSafeArea(.all)
                HStack {
                    // Left column for details and stats
                    VStack(alignment: .leading,
                            spacing: geometry.size.height * 0.02) {
                        Text(businessDetailTitle)
                                .font(.system(size: geometry.size.width * 0.05))

                        Text(dateRange)
                                .font(.system(size: geometry.size.width * 0.04))

                        // Use the extracted data for each statistic view
                        ForEach(statistics, id: \.title) { stat in
                            StatisticView(iconColor: stat.iconColor, title: stat.title, value: stat.value)
                        }
                    }
                            .padding(.top, geometry.size.height * 0.05)
                            .padding(.bottom, geometry.size.height * 0.05) // Increase padding on the bottom
                            .padding(.leading, geometry.size.width * 0.08)
                            .frame(width: geometry.size.width * 0.5, height: geometry.size.height)
                    Spacer()

                    // Right column for the progress ring, centered vertically
                    VStack {
                        Spacer()
                        ProgressRingView(progress: 75, thickness: geometry.size.width * 0.03) // Adapts thickness to width
                                .frame(width: geometry.size.width * 0.3, height: geometry.size.width * 0.3) // Adapts size to width
                        Spacer()
                    }
                            .frame(width: geometry.size.width * 0.5, height: geometry.size.height)
                }
                        .frame(width: geometry.size.width, height: geometry.size.height)
            }
                    //                    .background()
                    .cornerRadius(25)
//            .shadow(radius: 10)
//            .padding(geometry.size.width * 0.05)
        }
    }
}

struct ProgressRingView: View {
    var progress: CGFloat // 0 to 100
    var thickness: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                        .stroke(lineWidth: thickness)
                        .opacity(0.3)
                        .foregroundColor(Color.gray)

                Circle()
                        .trim(from: 0.0, to: progress / 100)
                        .stroke(style: StrokeStyle(lineWidth: thickness, lineCap: .round))
                        .foregroundColor(Color.green)
                        .rotationEffect(Angle(degrees: -90))
                HStack(alignment: .center, spacing: -110) {
                    Text("\(Int(progress))%")
                            .font(.system(size: geometry.size.width * 0.17))
                            .rotationEffect(Angle(degrees: -90))
                            .bold()  // 使文本加粗
                            .foregroundColor(.green)  // 设置文本颜色为绿色
                    Text("Grades Completed")
                            .font(.system(size: geometry.size.width * 0.07))
                            .rotationEffect(Angle(degrees: -90))
                }
                        .padding(.leading, 50)
            }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .rotationEffect(Angle(degrees: 90)) // Rotate the entire view to start from the top
        }
    }
}

struct StatisticView: View {
    var iconColor: Color
    var title: String
    var value: String

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: -280) {
                ZStack {
                    Circle()
                            .fill(iconColor)
                            .frame(width: geometry.size.width * 0.16, height: geometry.size.width * 0.16)

                    Image(systemName: "person.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(.white)
                            .frame(width: geometry.size.width * 0.08, height: geometry.size.width * 0.08)  // 略小于Circle，突出显示
                            .shadow(radius: 10)  // 添加阴影，增加悬浮感
                }
                        .frame(width: geometry.size.width * 0.16, height: geometry.size.width * 0.16)
                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .alignmentGuide(.leading) { d in
//                            d[.leading]
//                        }
                VStack(alignment: .leading, spacing: 0) {
                    Text(title).font(.system(size: geometry.size.width * 0.08))
                    Text(value).font(.system(size: geometry.size.width * 0.08))
                }
                .frame(maxWidth: .infinity, alignment: .leading)

            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}


#Preview(windowStyle: .automatic) {
    ProgressCardView()
}

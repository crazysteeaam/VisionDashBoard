//
//  ProgressCardView.swift
//  VisionDashBoard
//
//  Created by 徐政杰 on 2024/4/29.
//

import SwiftUI

// 业务图

// 示例数据
let businessDetailTitle = "工位总览"
let dateRange = "200工位·2024年5月11日"

struct StatisticData {
    var iconColor: Color
    var title: String
    var value: String
}

// A simple dashboard view with a progress ring and some statistics
struct ProgressCardView: View {
    var statistics = [
        StatisticData(iconColor: .blue, title: "日计划配套", value: "83.9%"),
        StatisticData(iconColor: .green, title: "日计划完成率", value: "22/30"),
        StatisticData(iconColor: .orange, title: "出勤率", value: "91%")
    ]

    var body: some View {
        GeometryReader { geometry in
            ZStack {
//                Color(.systemBackground)
//                        .edgesIgnoringSafeArea(.all)
                HStack {
                    // Left column for details and stats
                    VStack(alignment: .leading,
                            spacing: geometry.size.width > 1000 ? 25 : 10) {
                        Text(businessDetailTitle)
                            .font(.system(size: geometry.size.width > 1000 ? 60 : 45))
                            .bold()

                        Text(dateRange)
                                .font(.system(size:  geometry.size.width > 1000 ? 40 : 15))

                        // Use the extracted data for each statistic view
                        ForEach(statistics, id: \.title) { stat in
                            StatisticView(iconColor: stat.iconColor, title: stat.title, value: stat.value)
                        }
                    }
                            .padding(.top, geometry.size.width > 1000 ? 25 : 10)
                            .padding(.bottom, geometry.size.width > 1000 ? 25 : 10) // Increase padding on the bottom
                            .padding(.leading, geometry.size.width > 1000 ? 80 : 40)
                            .frame(width: geometry.size.width * 0.5, height: geometry.size.height)
                    Spacer()

                    // Right column for the progress ring, centered vertically
                    VStack {
                        Spacer()
                        ProgressRingView(progress: 73.3, thickness: geometry.size.width * 0.03) // Adapts thickness to width
                                .frame(width: geometry.size.width * 0.3, height: geometry.size.width * 0.3) // Adapts size to width
                        Spacer()
                    }
                            .frame(width: geometry.size.width * 0.5, height: geometry.size.height)
                }
            }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .cornerRadius(25)
//                    .onAppear {
//                        print("ProgressCard Width: \(geometry.size.width)")
//                        print("ProgressCard Height: \(geometry.size.height)")
//                    }
//                    .onChange(of: geometry.size.width) {
//                        print("ProgressCard Width: \(geometry.size.width)")
//                    }
//                    .onChange(of: geometry.size.height) {
//                        print("ProgressCard Height: \(geometry.size.height)")
//                    }
            
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
                HStack(alignment: .center, spacing: 0) {
                    Text("\(Int(progress))%")
                            .font(.system(size: geometry.size.width > 300 ? 60 : 35))
                            .rotationEffect(Angle(degrees: -90))
                            .bold()  // 使文本加粗
                            .foregroundColor(.green)  // 设置文本颜色为绿色
                            .padding(.leading,geometry.size.width > 300 ? 0 : -50)
                    Text("日计划完成率")
                            .font(.system(size: geometry.size.width > 300 ? 40 : 15))
                            .rotationEffect(Angle(degrees: -90))
                            .padding(.leading,geometry.size.width > 300 ? -40 : -50)
                }
                        .padding(.leading, 50)
            }
                    .frame(width: geometry.size.width, height: geometry.size.height)
//                    .onChange(of: geometry.size.width) {
//                        print("ProgressCard Width2: \(geometry.size.width)")
//                    }
//                    .onChange(of: geometry.size.height) {
//                        print("ProgressCard Height2: \(geometry.size.height)")
//                    }
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
            HStack(spacing: geometry.size.width > 420 ? -200 : -150) {
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
                    Text(title).font(.system(size: geometry.size.width > 420 ? 50 : 20))
                    Text(value).font(.system(size: geometry.size.width > 420 ? 50 : 20))
                }
                        .frame(maxWidth: .infinity, alignment: .leading)

            }
//                    .onChange(of: geometry.size.width) {
//                        print("ProgressCard Width2: \(geometry.size.width)")
//                    }
//                    .onChange(of: geometry.size.height) {
//                        print("ProgressCard Height2: \(geometry.size.height)")
//                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}


#Preview(windowStyle: .automatic) {
    ProgressCardView()
}

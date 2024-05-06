//
//  NotificationsWidgetView.swift
//  VisionDashBoard
//
//  Created by 徐政杰 on 2024/4/29.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct Notification: Identifiable {
    let id = UUID()
    let icon: Image
    let title: String
    let subtitle: String
    let color: Color
}

struct NotificationsWidgetView: View {
    let notifications = [
        Notification(icon: Image(systemName: "message.fill"), title: "Selena comments on your post ", subtitle: "20 minutes ago", color: .blue),
        Notification(icon: Image(systemName: "checkmark.circle.fill"), title: "Well done! You have a good job!", subtitle: "Yesterday", color: .green),
        Notification(icon: Image(systemName: "flag.fill"), title: "Your task is overdue for 13 hours", subtitle: "23 June 2021", color: .red)
    ]

    var body: some View {
        VStack(alignment: .leading) {
            Text("待办详情")
                    .font(.system(size: 62))
                    .padding(.bottom, 30)
            ForEach(notifications) {
                notification in
                NotificationView(notification: notification)
            }
        }
                .padding(.horizontal, 20)
                .cornerRadius(20)
                .padding()
    }
}


struct NotificationView: View {
    let notification: Notification

    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .top) {
                ZStack {
                    Circle()
                        .fill(notification.color)
                        .frame(width: geometry.size.width * 0.14, height: geometry.size.width * 0.14)
                        .frame(minWidth: 60, minHeight: 60)
                    notification.icon
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(notification.color)
                        .cornerRadius(10)
                        .frame(width: geometry.size.width * 0.1, height: geometry.size.width * 0.1)
                        .frame(minWidth: 60, minHeight: 60)
                }
                
                VStack(alignment: .leading) {
                    Text(notification.title)
                        .font(.system(size: geometry.size.width * 0.06))
                        .padding(1)
                    Text(notification.subtitle)
                        .font(.system(size: geometry.size.width * 0.04))
                        .foregroundColor(.gray)
                }
//                .frame(width: geometry.size.width)
                .padding(.horizontal, 20)
            }
            //            .background(notification.color)
//                .padding(.horizontal,0)
//            .frame(width: geometry.size.width * 0.8)
        }
        .frame(minWidth: 500, idealWidth: 500, maxWidth:800 , minHeight: 100, idealHeight: 3000)
    }
}

#Preview(windowStyle: .automatic) {
    NotificationsWidgetView()
        .frame(minWidth: 500,minHeight: 200)
}

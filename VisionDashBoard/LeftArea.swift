//
//  LeftArea.swift
//  VisionDashBoard
//
//  Created by 徐政杰 on 2024/4/29.
//

import SwiftUI

struct LeftArea: View {
    var body: some View {

        GeometryReader { geometry in
            VStack {
                ProgressCardView()
                        .background(.ultraThinMaterial)
                        //                        .opacity(0.5)
                        .frame(width: geometry.size.width * 0.96, height: geometry.size.height * 0.46)
                        .cornerRadius(50)
                        .padding(20)

                HStack {
                    ProgressBarView()
                            .background(.ultraThinMaterial)
                            .frame(width: geometry.size.width * 0.46, height: geometry.size.height * 0.46)
                            .cornerRadius(50)
                            .padding(20)
                    NotificationsWidgetView()
                            .background(.ultraThinMaterial)
                            .frame(width: geometry.size.width * 0.46, height: geometry.size.height * 0.46)
                            .cornerRadius(50)
                            .padding(20)
                }
            }
        }
                .frame(minWidth: 800, minHeight: 1100)
    }

}

#Preview(windowStyle: .automatic) {

    TabView() {
        LeftArea()
                .frame(minWidth: 800, minHeight: 1100)
        ProgressBarView()

    }
}

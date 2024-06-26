//
//  LeftArea.swift
//  VisionDashBoard
//
//  Created by 徐政杰 on 2024/4/29.
//

import SwiftUI

struct LeftArea: View {
    @EnvironmentObject var viewModel: SharedViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack { 
                ProgressCardView()
                        .background(.ultraThinMaterial)
                        //                        .opacity(0.5)
                        .frame(width: geometry.size.width * 0.96, height: geometry.size.height * 0.46)
                        .cornerRadius(45)
                        .padding(5)

                HStack {
                    ProgressBarView()
                            .background(.ultraThinMaterial)
                            .frame(width: geometry.size.width * 0.47, height: geometry.size.height * 0.5)
                            .cornerRadius(45)
                            .padding(5)
                        PlaneView()
                            .background(.ultraThinMaterial)
                            .frame(width: geometry.size.width * 0.47, height: geometry.size.height * 0.5)
                            .cornerRadius(45)
                            .padding(5)
                            .onTapGesture {
                                withAnimation {
                                    print("123123")
                                    viewModel.isRightAreaVisible.toggle()
                                }
                            }
                }
            }
            .onAppear {
                print("LeftArea Width: \(geometry.size.width)")
                print("LeftArea Height: \(geometry.size.height)")
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }

}

#Preview(windowStyle: .automatic) {

    TabView() {
        LeftArea()
        ProgressBarView()

    }
}

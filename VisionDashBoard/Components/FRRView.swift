//
//  FRRView.swift
//  VisionDashBoard
//
//  Created by 徐政杰 on 2024/5/9.
//

import SwiftUI

struct FRRView: View {
    let subjects = [
        ("FRR号：R-06D0070341", "AO名称：SD200-SD218占位右侧座椅滑轨定位制孔"),
        ("FRR号：R-06D0070182", "AO名称：移交200工位前撤保留"),
        ("FRR号：R-06D0069580", "AO名称：移交200前撤保留"),
        ("FRR号：R-06D0069794", "AO名称：移交211工位前门禁检查")
    ]

    var body: some View {
        GeometryReader { geometry in
            Text("FRR清单")
                    .font(.system(size: geometry.size.width > 1000 ? 50 : 25))
                    .bold()
                    .padding()
                    .padding(.bottom, 0)
                    .padding(.leading, 20)

            VStack(alignment: .leading) {
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(subjects, id: \.0) { subject in
                            TextView(subject: (subject.0, subject.1))
                                    .cornerRadius(20)
                                    .frame(width: geometry.size.width * 0.95, height: geometry.size.width > 1000 ? 80 : 55)
                                    .padding(.bottom, geometry.size.width > 1000 ? 7 : 0)
                        }
                    }
                            .frame(width: geometry.size.width)
                            .padding()
                }
            }
                    .padding()
                    .padding(.top, 50)
                    .frame(width: geometry.size.width)
        }
    }
}

private struct TextView: View {
    let subject: (String, String)
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Text(subject.0)
                        .font(.system(size: geometry.size.width > 500 ? 30 : 17, design: .rounded))
                Text(subject.1)
                        .font(.system(size: geometry.size.width > 500 ? 30 : 17, design: .rounded))
            }
                    .padding()
                    //            .onChange(of: geometry.size.width) {
                    //               print("TextView Width: \(geometry.size.width)")
                    //           }
                    //           .onChange(of: geometry.size.height) {
                    //               print("TextView Height: \(geometry.size.height)")
                    //           }
                    .frame(width: geometry.size.width, height: geometry.size.width > 500 ? 80 : 55)
                    .background(.ultraThickMaterial)
                    .opacity(0.8)
        }
    }
}

#Preview(windowStyle: .automatic) {
    FRRView()
}

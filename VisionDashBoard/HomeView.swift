//
//  HomeView.swift
//  VisionDashBoard
//
//  Created by 徐政杰 on 2024/4/29.
//

import SwiftUI

struct HomeView: View {
    @Environment(TabViewModel.self) private var model

    var body: some View {

        @Bindable var model = model

        TabView(selection: $model.selectedType) {
            ForEach(TabViewModel.SelectionType.allCases) { selectionType in
                LeftArea()
                    .frame(minWidth: 800,minHeight: 1100)
            }
        }
    }
}

#Preview {
    HomeView()
}

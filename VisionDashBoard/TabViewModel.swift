//
//  TabViewModel.swift
//  VisionDashBoard
//
//  Created by 徐政杰 on 2024/4/29.
//

import SwiftUI
import Observation


@Observable
class TabViewModel {

    var selectedType: SelectionType = .home
    var isShowing: Bool = false

    enum SelectionType: String, Identifiable, CaseIterable {
        case home = "home"
        case fire = "fire"

        var id: String {
            return rawValue
        }

        var title: String {
            switch self {
            case .home:
                return "主页"
            case .fire:
                return "燃尽图"
            }
        }
    }

}

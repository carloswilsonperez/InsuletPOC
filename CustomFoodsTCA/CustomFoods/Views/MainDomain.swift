//
//  MenuDomain.swift
//  CustomFoods
//
//  Created by Carlos Wilson on 11/01/22.
//

import Foundation
import SwiftUI
import ComposableArchitecture
import Combine


struct MainDomainState: Equatable {
    var menuItems: [MenuItem] = Menu.menuItems
    var showAddTodoView = false;
    
    var topMenuItems: [MenuItem] {
        return [
            MenuItem(label: "Switch Mode", icon: "switch.2"),
            MenuItem(label: "Set Temp Basal", icon: "circle.grid.cross"),
            MenuItem(label: "Hypo Protect", icon: "cross"),
            MenuItem(label: "Pod", icon: "capsule")
        ]
    }
    
    var middleMenuItems: [MenuItem] {
        return [
            MenuItem(label: "Switch Mode", icon: "switch.2"),
            MenuItem(label: "Set Temp Basal", icon: "circle.grid.cross"),
            MenuItem(label: "Hypo Protect", icon: "cross"),
            MenuItem(label: "Pod", icon: "capsule"),
            MenuItem(label: "Custom Foods", icon: "")
        ]
    }
    
    var bottomMenuItems: [MenuItem] {
        return [
            MenuItem(label: "Switch Mode", icon: "switch.2"),
            MenuItem(label: "Set Temp Basal", icon: "circle.grid.cross"),
            MenuItem(label: "Hypo Protect", icon: "cross"),
            MenuItem(label: "Pod", icon: "capsule")
        ]
    }
}

enum MainDomainAction: Equatable {
    case didLinkTap
    case navigateToFoodListView
}

struct MainDomainEnvironment {
    
}

let MainDomainReducer = Reducer<MenuDomainState, MenuDomainAction, MenuDomainEnvironment> {
    state, action, _ in
    
    switch action {
    case .didLinkTap:
            print("Hello")
        return .none
        
    case .navigateToFoodListView:
        return .none
    }
    
}


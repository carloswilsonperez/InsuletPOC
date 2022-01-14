//
//  MenuDomain.swift
//  CustomFoods
//
//  Created by Carlos Wilson on 11/01/22.
//

import SwiftUI
import ComposableArchitecture


struct MenuDomainState: Equatable {
    var isRootActive = false
    
    var sections: [MenuSection] = [
        MenuSection(sectionType: .actions, items: [
            MenuItem(label: StringConstants.switchMode, icon: StringConstants.switchModeIcon),
            MenuItem(label: StringConstants.setTempBasal, icon: StringConstants.setTempBasalImage),
            MenuItem(label: StringConstants.hypoProtect, icon: StringConstants.hypoProtectImage),
            MenuItem(label: StringConstants.pod, icon: StringConstants.podImage),
            MenuItem(label: StringConstants.enterBG, icon: StringConstants.enterBGImage),
            MenuItem(label: StringConstants.suspendInsulin, icon: StringConstants.suspendInsulinImage)]),
        MenuSection(sectionType: .programs, items: [
            MenuItem(label: StringConstants.basalPrograms),
            MenuItem(label: StringConstants.tempBasalPresents),
            MenuItem(label: StringConstants.customFoodsLabel)]),
        MenuSection(sectionType: .settings, items: [
            MenuItem(label: StringConstants.editSettings)]),
    ]
    
    var foodsListDomainState = FoodsListViewDomainState()
}

enum MenuDomainAction: Equatable {
    case didLinkTap
    case navigateToFoodListView(Bool)
}

struct MenuDomainEnvironment {}

let MenuDomainReducer = Reducer<MenuDomainState, MenuDomainAction, MenuDomainEnvironment> {
    state, action, _ in
    
    switch action {
    case .didLinkTap:
        return .none
    case .navigateToFoodListView(let isActive):
        return .none
    }
    
}


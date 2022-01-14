//
//  MenuDomain.swift
//  CustomFoods
//
//  Created by Carlos Wilson on 11/01/22.
//

import SwiftUI
import ComposableArchitecture


struct MainDomainState: Equatable {}

enum MainDomainAction: Equatable {}

struct MainDomainEnvironment {}

let MainDomainReducer = Reducer<MainDomainState, MainDomainAction, MainDomainEnvironment> {
    state, action, _ in
    return .none
}


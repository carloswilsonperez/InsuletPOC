//
//  AddFoodDomain.swift
//  CustomFoods
//
//  Created by Carlos Wilson on 11/01/22.
//

import Foundation
import SwiftUI
import ComposableArchitecture
import Combine


struct AddFoodDomainState: Equatable {
    
}

enum AddFoodDomainAction: Equatable {
    case nameTextFieldChanged(text: String)
    case carbsTextFieldChanged(text: String)
    case didButtonTap
}

struct AddFoodDomainEnvironment {
    
}

let AddFoodDomainReducer = Reducer<AddFoodDomainState, AddFoodDomainAction, AddFoodDomainEnvironment> {
    state, action, _ in
    
    switch action {
    case .nameTextFieldChanged:
        return .none
    case .carbsTextFieldChanged:
        return .none
    case .didButtonTap:
        return .none
    }
}


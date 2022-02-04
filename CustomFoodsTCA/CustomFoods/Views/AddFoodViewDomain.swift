//
//  ResumeInsulinDomain.swift
//  CustomFoods
//
//  Created by Carlos Wilson on 01/02/22.
//

import Foundation
import ComposableArchitecture
import SwiftUI

struct AddFoodViewDomainState: Equatable {
    var alert: AlertState<AddFoodViewDomainAction>?
    var name: String = ""
    var carbs: String = ""
    var addFoodButonBackgroundColor = Color.gray
}

enum AddFoodViewDomainAction: Equatable {
    case tappedSaveCustomFoodButton
    case alertOkTapped
    case addFood(Food)
    case doNothing
    case emptyGoBack
    
    case nameTextFieldChanged(text: String)
    case carbsTextFieldChanged(text: String)
}

struct AddFoodViewDomainEnvironment {
}

let addFoodViewDomainReducer = Reducer<AddFoodViewDomainState,AddFoodViewDomainAction,AddFoodViewDomainEnvironment> {
    state, action, environment in
    switch action {
    case .tappedSaveCustomFoodButton:
        state.alert = .init(
            title: TextState(StringConstants.customFoodsLabel),
            message: TextState("\(StringConstants.yourFood) \"\(state.name)\" \(StringConstants.forLabel) \(state.carbs)\(StringConstants.hasBeenAdded)"),
            dismissButton: .default(TextState(StringConstants.ok), send: .alertOkTapped)
        )
        return .none
        
    case .alertOkTapped:
        state.alert = nil
       
        let food = Food(
            name: state.name,
            carbohidrates: state.carbs
        )
        state.name = ""
        state.carbs = ""
        return Effect(value: .addFood(food))
        
    case .nameTextFieldChanged(let text):
        print("addFoodViewDomain: .nameTextFieldChanged")
        state.name = text
        state.addFoodButonBackgroundColor = getButtonTint(state.name, state.carbs)
        return .none
        
    case .carbsTextFieldChanged(let text):
        state.carbs = text
        print("addFoodViewDomain: .carbsTextFieldChanged")
        state.addFoodButonBackgroundColor = getButtonTint(state.name, state.carbs)
        return .none
        
    case .doNothing:
        print("addFoodViewDomain: .doNothing")
        return Effect(value: .emptyGoBack)
        
    default:
        return .none
    }
}

func getButtonTint(_ name: String, _ carbs: String) -> Color {
    let predicate = !name.isEmpty && !carbs.isEmpty
    return predicate ? Color(red: 98/255, green: 0.0, blue: 234/255) : Color.gray
}

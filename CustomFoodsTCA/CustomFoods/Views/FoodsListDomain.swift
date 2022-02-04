//
//  MenuFormDomain.swift
//  CustomFoods
//
//  Created by Carlos Wilson on 01/02/22.
//

import SwiftUI
import ComposableArchitecture


struct FoodsListViewDomainState: Equatable {
    var isRootActive = false
    var foods: [Food] = []
    var addFoodViewConfigState = AddFoodViewDomainState()
    var activeColor = Color(red: 98/255, green: 0.0, blue: 234/255)
}

enum FoodsListViewDomainAction: Equatable {
    case navigateToAddFoodView(isActive: Bool)
    case loadedAddFoodAction(AddFoodViewDomainAction)
    case delete(at: IndexSet)
    case move(IndexSet, Int)
}

typealias FoodsListViewDomainEnvironment = Void

let foodsListViewDomainReducer = Reducer<FoodsListViewDomainState, FoodsListViewDomainAction, FoodsListViewDomainEnvironment>.combine(
    addFoodViewDomainReducer
        .pullback(
            state: \.addFoodViewConfigState,
            action: /FoodsListViewDomainAction.loadedAddFoodAction,
            environment: { _ in AddFoodViewDomainEnvironment() }
        ),
    
        .init{ state, action, environment in
            
            switch action{
                
            case let .navigateToAddFoodView(isActive):
                if isActive {
                    state.isRootActive = isActive
                    return .none
                } else {
                    return .none
                }
                
            case .delete(at: let indexSet):
                state.foods.remove(atOffsets: indexSet)
                return .none
                
            case .move(let from, let to):
                state.foods.move(fromOffsets: from, toOffset: to)
                return .none
                
            case let .loadedAddFoodAction(action):
                switch action {
                    case let .addFood(food):
                        print("loadedAddFoodAction: popToRootView \(state.addFoodViewConfigState.name)")
                        if state.foods.contains(where: { $0.name == food.name }) {
                            var updatedFoods = [Food]()
                            state.foods.forEach { existingFood in
                                if existingFood.name == food.name {
                                    let newFood = Food(name: food.name, carbohidrates: food.carbohidrates)
                                    appendFood(food: newFood, for: &updatedFoods)

                                } else {
                                    appendFood(food: existingFood, for: &updatedFoods)
                                }
                            }
                            state.foods = updatedFoods
                        } else {
                            state.foods.append(food)
                        }
                        
                        state.isRootActive = false
                        return .none
                        
                case .emptyGoBack:
                    state.isRootActive = false
                    return .none
                        
                    default:
                        return .none
                }
            }
        }
)

func appendFood(food: Food, for foodsList: inout [Food]) {
    return foodsList.append(food)
}



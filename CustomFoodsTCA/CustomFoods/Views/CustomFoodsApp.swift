//
//  CustomFoodsApp.swift
//  CustomFoods
//
//  Created by Carlos Wilson on 17/12/21.
//

import SwiftUI
import ComposableArchitecture


@main
struct CustomFoodsApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            MainView(foodData: FoodData(),
                     storeMenuView: Store(
                        initialState: MenuDomainState(),
                        reducer: MenuDomainReducer,
                        environment: MenuDomainEnvironment()
                     ),
                     storeMainView: Store(
                        initialState: MainDomainState(),
                        reducer: MainDomainReducer,
                        environment: MainDomainEnvironment()
                     )
            )
        }
    }
}


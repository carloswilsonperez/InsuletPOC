//
//  FoodsListDomain.swift
//  CustomFoods
//
//  Created by Carlos Wilson on 11/01/22.
//

import Foundation
import SwiftUI
import ComposableArchitecture
import Combine


struct FoodsListDomainState: Equatable {
    
}

enum FoodsListDomainAction: Equatable {
    case myAction
}

struct FoodsListDomainEnvironment {
    
}

let FoodsListDomainReducer = Reducer<FoodsListDomainState, FoodsListDomainAction, FoodsListDomainEnvironment> {
    state, action, _ in
    
    switch action {
    case .myAction:
        return .none
    }
}

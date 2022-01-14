//
//  MenuFormView.swift
//  CustomFoods
//
//  Created by Carlos Wilson on 01/02/22.
//

import SwiftUI
import ComposableArchitecture

struct FoodsListView: View {
    let store: Store<FoodsListViewDomainState, FoodsListViewDomainAction>
    
    var body: some View {
        VStack {
            WithViewStore(self.store) { viewStore in
                if viewStore.state.foods.count > 0 {
                    List {
                        ForEach(viewStore.state.foods){ food in
                            HStack{
                                Text(food.name)
                                Spacer()
                                Text("\(food.carbohidrates) \(StringConstants.grams)")
                                    .foregroundColor(Color.purple)
                            }
                        }
                        .onDelete(perform: { indexSet in
                            viewStore.send(.delete(at: indexSet))
                        })
                        .onMove(perform: { from, to in
                            viewStore.send(.move(from, to))
                        })
                    }
                    .listStyle(.plain)
                    Spacer()
                } else {
                    Spacer()
                    Text(StringConstants.noFoodsMessage).foregroundColor(.gray)
                    Spacer()
                }
                
                NavigationLink(
                    isActive: viewStore.binding(
                        get: \.isRootActive,  // Toggle to show/hide the AddFoodView
                        send: FoodsListViewDomainAction.navigateToAddFoodView(isActive:)
                    ),
                    
                    destination: {
                        AddFoodView.init(store: self.store.scope(
                            state: \.addFoodViewConfigState,
                            action: FoodsListViewDomainAction.loadedAddFoodAction
                        ))
                    }) {
                        Button(action: {
                            viewStore.send(.navigateToAddFoodView(isActive: true)) // Move to AddFoodView
                        }) {
                            Text(StringConstants.addCustomFood)
                        }.buttonStyleReusable(withBackground: viewStore.activeColor)
                        .padding()
                    }
            }
        }
        .background(Color.white)
        .navigationBarTitle(StringConstants.customFoodsLabel)
        .navigationBarItems(trailing: EditButton())
    }
}

struct FoodsListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodsListView(
            store:Store(
                initialState: FoodsListViewDomainState(),
                reducer: foodsListViewDomainReducer,
                environment: FoodsListViewDomainEnvironment()
            )
        )
    }
}

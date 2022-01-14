//
//  ContentView.swift
//  CustomFoods
//
//  Created by Carlos Wilson on 17/12/21.
//

import SwiftUI
import CoreData
import ComposableArchitecture
import simd

struct MenuView: View {
    let store: Store<MenuDomainState, MenuDomainAction>
            
    var body: some View {
        NavigationView {
            WithViewStore(self.store) { viewStore in
                List {
                    ForEach(viewStore.sections) { section in
                        Section(header: Text(section.sectionType.rawValue)) {
                            ForEach(section.items) { menuItem in
                                if menuItem.label == "Custom Foods" {
                                    NavigationLink(
                                        destination: FoodsListView(
                                            store: Store(
                                                initialState: FoodsListDomainState(),
                                                reducer: FoodsListDomainReducer,
                                                environment: FoodsListDomainEnvironment()
                                            )
                                        )
                                    ) {
                                        MenuRowView(label: menuItem.label, icon: menuItem.icon)
                                    }
                                } else {
                                    MenuRowView(label: menuItem.label, icon: menuItem.icon)
                                }
                            }
                        }
                    }
                }.listStyle(.grouped).navigationBarTitle("Menu")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(
            store: Store(
                initialState: MenuDomainState(),
                reducer: MenuDomainReducer,
                environment:  MenuDomainEnvironment()
            )
        )
    }
}

/*
FoodsListView(
store: Store(
    initialState: FoodsListDomainState(),
    reducer: FoodsListDomainReducer,
    environment: FoodsListDomainEnvironment()
)
) */


//
//  ContentView.swift
//  CustomFoods
//
//  Created by Carlos Wilson on 17/12/21.
//

import SwiftUI
import ComposableArchitecture


struct MenuView: View {
    let store: Store<MenuDomainState, MenuDomainAction>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            NavigationView {
                List {
                    ForEach(viewStore.sections) { section in
                        Section(header: Text(section.sectionType.rawValue)) {
                            ForEach(section.items) { menuItem in
                                if menuItem.label == StringConstants.customFoodsLabel {
                                    NavigationLink(
                                        destination: FoodsListView(
                                            store: Store(
                                                initialState: FoodsListViewDomainState(),
                                                reducer: foodsListViewDomainReducer,
                                                environment: FoodsListViewDomainEnvironment()
                                            )
                                        )
                                    ) {
                                        MenuRowView(label: menuItem.label, icon: menuItem.icon)
                                    }
                                } else {
                                    NavigationLink(
                                        destination: ListRowView(labelContent: menuItem.label)
                                    ) {
                                        MenuRowView(label: menuItem.label, icon: menuItem.icon)
                                    }
                                }
                            }
                        }
                    }
                }.listStyle(.grouped)
                .navigationBarTitle(StringConstants.menuLabel)
            }.foregroundColor(Color.black)
            .navigationViewStyle(StackNavigationViewStyle())
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

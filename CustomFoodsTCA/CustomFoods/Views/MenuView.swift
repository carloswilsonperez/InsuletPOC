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
    
    // private var menuItems: [MenuItem] = Menu.menuItems
    
    // State to start/stop the alert dialog
    // @State private var showAddTodoView = false;
    
    var body: some View {
        WithViewStore(self.store) {
            viewStore in
            
            List {
                Text("MENU")
                    .font(.headline)
                Section(header: HStack {
                    Text("Actions")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                    
                    Spacer()
                }
                            .background(Color(red: 247/255, green: 247/255, blue: 247/255))
                            .listRowInsets(EdgeInsets(
                                top: 0,
                                leading: 0,
                                bottom: 0,
                                trailing: 0))) {
                                    ForEach(viewStore.topMenuItems, id: \.self) { item in
                                        NavigationLink {
                                            Text("Item at \(item.label)")
                                        } label: {
                                            MenuRowView(label: item.label, icon: item.icon)
                                        }.listRowSeparator(.hidden)
                                    }
                                }
                
                Section(header: HStack {
                    Text("Programs & Presets")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                    
                    Spacer()
                }
                            .background(Color(red: 247/255, green: 247/255, blue: 247/255))
                            .listRowInsets(EdgeInsets(
                                top: 0,
                                leading: 0,
                                bottom: 0,
                                trailing: 0))) {
                                    
                                    ForEach((viewStore.middleMenuItems, id: \.self)) { item in
                                        NavigationLink {
                                            if item.label == "Custom Foods" {
                                                FoodsListView()
                                            } else {
                                                Text("Item at \(item.label)")
                                            }
                                        } label: {
                                            MenuRowView(label: item.label, icon: item.icon)
                                        }.listRowSeparator(.hidden)
                                    }
                                }
                
                Section(header: HStack {
                    Text("Settings")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                    
                    Spacer()
                }
                            .background(Color(red: 247/255, green: 247/255, blue: 247/255))
                            .listRowInsets(EdgeInsets(
                                top: 0,
                                leading: 0,
                                bottom: 0,
                                trailing: 0))) {
                                    ForEach((viewStore.bottomMenuItems, id: \.self)) { item in
                                        NavigationLink {
                                            Text("Item at \(item.label)")
                                        } label: {
                                            MenuRowView(label: item.label, icon: item.icon)
                                        }
                                    }
                                }
            }.listStyle(GroupedListStyle())
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    
                }.padding(-1)
            
            
        }
        
    }
}

/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
 */

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        MenuView(
            store: Store(initialState: MenuDomainState(),
                              reducer: MenuDomainReducer,
                             environment:  MenuDomainEnvironment()
                        )
                )
    }
}

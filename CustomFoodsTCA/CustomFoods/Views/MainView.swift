//
//  MainView.swift
//  CustomFoods
//
//  Created by Carlos Wilson on 19/12/21.
//

import SwiftUI
import ComposableArchitecture


struct MainView: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label(StringConstants.home, systemImage: StringConstants.homeImage)
                }
                .tag(0)
            
            AlertsView()
                .tabItem {
                    Label(StringConstants.alert, systemImage: StringConstants.alertImage)
                }
                .tag(1)
            
            MenuView(
                store: Store(
                    initialState: MenuDomainState(),
                    reducer: MenuDomainReducer,
                    environment:  MenuDomainEnvironment()
                )
            )
                .tabItem {
                    Label(StringConstants.menu, systemImage: StringConstants.menuImage)
                }
                .tag(2)
            
            CalendarView()
                .tabItem {
                    Label(StringConstants.calendar, systemImage: StringConstants.calendarImage)
                }
                .tag(3)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

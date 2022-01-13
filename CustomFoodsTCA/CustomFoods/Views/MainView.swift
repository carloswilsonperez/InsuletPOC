//
//  MainView.swift
//  CustomFoods
//
//  Created by Carlos Wilson on 19/12/21.
//

import SwiftUI
import ComposableArchitecture


struct HomeView: View {
    var body: some View {
        Text("This is the HomeView")
    }
}

struct AlertsView: View {
    var body: some View {
        VStack {
            Text("This is the AlertsView")
        }
    }
}

struct CalendarView: View {
    var body: some View {
        VStack {
            Text("This is the CalendarView")
        }
    }
}

struct MainView: View {
    @StateObject var foodData: FoodData
    
    let storeMenuView: Store<MenuDomainState, MenuDomainAction>
    let storeMainView: Store<MainDomainState, MainDomainAction>

    var body: some View {
        NavigationView {
            TabView {
                HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)
                
                AlertsView()
                    .tabItem {
                        Label("Alerts", systemImage: "bell")
                    }
                    .tag(1)
                
                MenuView(store: storeMenuView)
                    .tabItem {
                        Label("Menu", systemImage: "menucard")
                    }
                    .tag(2)
                
                CalendarView()
                    .tabItem {
                        Label("Calendar", systemImage: "calendar")
                    }
                    .tag(3)
            }
        }
        .environmentObject(foodData)
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}

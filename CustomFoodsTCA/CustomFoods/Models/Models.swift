//
//  Food.swift
//  CustomFoods
//
//  Created by Carlos Wilson on 17/12/21.
//

import Foundation

struct Food: Equatable, Identifiable, Hashable {
    var id = UUID()
    var name: String = ""
    var carbohidrates: String = ""
}

struct MenuItem : Equatable, Identifiable {
    var id = UUID()
    var label: String = ""
    var icon: String?
}

enum SectionType: String {
    case actions
    case programs
    case settings
}

struct MenuSection: Identifiable, Equatable {
    var id = UUID()
    let sectionType: SectionType
    let items: [MenuItem]
}

struct StringConstants {
    static let homeLabel = "This is the HomeView"
    static let alertsLabel = "This is the AlertsView"
    static let calendarLabel = "This is the CalendarView"
    
    static let home = "Home"
    static let homeImage = "house"
    static let alert = "Alerts"
    static let alertImage = "bell"
    static let menu = "Menu"
    static let menuImage = "menucard"
    static let calendar = "Calendar"
    static let calendarImage = "ellipsis"
    
    static let customFoodsLabel = "Custom Foods"
    static let menuLabel = "Menu"
    
    static let switchMode = "Switch Mode"
    static let switchModeIcon = "switch.2"
    static let setTempBasal = "Set Temp Basal"
    static let setTempBasalImage = "circle.grid.cross"
    static let hypoProtect = "Hypo Protect"
    static let hypoProtectImage = "cross"
    static let pod = "Pod"
    static let podImage = "capsule"
    static let enterBG = "Enter BG"
    static let enterBGImage = "waveform.path.ecg"
    static let suspendInsulin = "Suspend Insulin"
    static let suspendInsulinImage = "xmark"
    static let basalPrograms = "Basal Programs"
    static let tempBasalPresents = "Temp Basal Presets"
    static let editSettings = "Edit Settings"
    
    static let grams = "g"
    static let noFoodsMessage = """
                                    You have not added any foods yet.
                                    Tap "Add Custom Food" to get started
                                    """
    static let addCustomFood = "Add Custom Food"
    static let buttonWidth = 300
    
    static let foodNameHeader = "Food Name"
    static let foodNamePlaceholder = "Enter Food Name"
    static let foodCarbsHeader = "Carbs (g)"
    static let foodCarbsPlaceholder = "Enter carbs"
    static let saveToCustomFoods = "Save To Custom Foods"
    static let addFoodBarTitle = "Add Food"
    
    static let chevronLeft = "chevron.left"
    static let backLabel = "Back"
}

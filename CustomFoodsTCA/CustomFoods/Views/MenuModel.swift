//
//  ItemMenu.swift
//  POC
//
//  Created by Fabian Romero on 10/23/20.
//
import SwiftUI

enum Destination: Equatable {
    case resumeInsulin, none
}

struct MenuItem2: Identifiable, Equatable {
    var id = UUID()
    var title: String
    var imageName: String
    var destination: Destination = .none
}

struct MenuRow: Equatable {
    
    var itemMenu = [MenuItem2(title: "Switch Mode", imageName: "switchMode"),
                    MenuItem2(title: "Set Temp Basal", imageName: "basal"),
                    MenuItem2(title: "Hypo Protect", imageName: "HypoPro"),
                    MenuItem2(title: "POD", imageName: "Pod"),
                    MenuItem2(title: "Enter BG", imageName: "BG"),
                    MenuItem2(title: "Resume Insulin", imageName: "suspend", destination: .resumeInsulin)]

}

enum PodState: Equatable{
    case suspended
    case active
    case none
}


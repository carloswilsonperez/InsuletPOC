//
//  MenuRowView.swift
//  CustomFoods
//
//  Created by Carlos Wilson on 22/12/21.
//

import SwiftUI

struct MenuRowView: View {
    var label: String
    var icon: String?
    
    var body: some View {
        HStack {
            if let icon = icon {
                MenuIconView(icon: icon)
            }
            Text(label)
                .fontWeight(.bold)
                
            Spacer()
        }
    }
}

struct MenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        MenuRowView(label: "label", icon: "waveform.path.ecg")
    }
}

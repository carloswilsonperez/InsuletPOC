//
//  ListRowView.swift
//  CustomFoods
//
//  Created by Carlos Wilson on 03/02/22.
//

import SwiftUI

struct ListRowView: View {
    var labelContent: String
    
    var body: some View {
        Text("Item at \(labelContent)")
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(labelContent: "Example")
    }
}

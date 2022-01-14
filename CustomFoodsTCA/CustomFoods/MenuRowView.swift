//
//  MenuRowView.swift
//  TCA
//
//  Created by Fabian Romero on 11/21/20.
//

import SwiftUI

struct MenuRowView: View {
    let imagename: String
    let title: String
    
    var body: some View {
        HStack{
            Image(imagename)
                .resizable()
                .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text(title)
        }.padding([.top,.trailing,.bottom],5)
    }
}

struct MenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        MenuRowView(imagename: "suspend", title: "Suspend Insulin")
            .previewLayout(.sizeThatFits)
    }
}

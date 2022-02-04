//
//  ResumeInsulin.swift
//  CustomFoods
//
//  Created by Carlos Wilson on 01/02/22.
//

import SwiftUI
import ComposableArchitecture


struct AddFoodView: View {
    
    let store: Store<AddFoodViewDomainState, AddFoodViewDomainAction>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                CustomBackButton
                TitleAddFood
                
                Form {
                    Section(header: Text(StringConstants.foodNameHeader)
                                .foregroundColor(.black)
                                .font(.headline).bold()) {
                        
                        TextField(StringConstants.foodNamePlaceholder,
                                  text: viewStore.binding(
                                    get: { $0.name },
                                    send: { AddFoodViewDomainAction.nameTextFieldChanged(text: $0) }
                                  )
                        )
                    }.textCase(nil)
                    
                    Section(header: Text(StringConstants.foodCarbsHeader)
                                .foregroundColor(.black)
                                .font(.headline).bold()
                    ) {
                        TextField(StringConstants.foodCarbsPlaceholder,
                                  text: viewStore.binding(
                                    get: { $0.carbs },
                                    send: { AddFoodViewDomainAction.carbsTextFieldChanged(text: $0) }
                                  )
                        ).keyboardType(.numberPad)
                    }.textCase(nil)
                }
                Spacer()
                
                
                Button(action: {
                    viewStore.send(.tappedSaveCustomFoodButton)
                }) {
                    Text(StringConstants.saveToCustomFoods)
                        .fontWeight(.medium)
                        .font(.headline)
                }
                .buttonStyleReusable(withBackground: viewStore.addFoodButonBackgroundColor)
                .alert(
                    self.store.scope(state: { $0.alert }),
                    dismiss: .doNothing
                )
            }
            .navigationBarTitle(StringConstants.addFoodBarTitle, displayMode: .automatic)
            .navigationBarHidden(true)
            .padding(.bottom)
        }
    }
    
    private var TitleAddFood : some View {
        HStack {
            Text(StringConstants.addFoodBarTitle)
                .font(.system(size: 32.0))
                .fontWeight(.bold)
            Spacer()
        }.padding(.leading)
    }
    
    private var CustomBackButton : some View {
        WithViewStore(self.store){ viewStore in
            
            Button(action:{
                viewStore.send(.doNothing)
            }, label: {
                HStack {
                    Image(systemName: StringConstants.chevronLeft)
                        .foregroundColor(.blue)
                        .imageScale(.large)
                    Text(StringConstants.backLabel)
                        .foregroundColor(.blue)
                    Spacer()
                }
            })
                .padding([.leading,.top,.bottom], 10)
        }
    }
}

struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView(store: Store(
            initialState: AddFoodViewDomainState(),
            reducer: addFoodViewDomainReducer,
            environment: AddFoodViewDomainEnvironment()))
    }
}




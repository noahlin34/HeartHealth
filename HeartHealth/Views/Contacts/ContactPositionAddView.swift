//
//  ContactPositionAddView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-19.
//

import SwiftUI

struct ContactPositionAddView: View {
    
    @Binding var isPresentingMedicationAdd: Bool
    @State var positionField = ""
    
    let nameToAdd: String
    
    
    var body: some View {
        VStack {
            
            Text("What is the contact's position")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            TextField("E.g, Cardiologist, Nurse Practicioner, etc.", text: $positionField)
                .padding([.vertical, .leading])
                .onReceive(positionField.publisher.collect()) {
                    positionField = String($0.prefix(30))
                }
            
            NavigationLink(destination: ContactPhoneAddView(isPresentingMedicationAdd: $isPresentingMedicationAdd, nameToAdd: nameToAdd, positionToAdd: positionField)) {
                Text("Next")
                    .frame(width: 300)
            }
            .buttonStyle(.borderedProminent)
            .padding(.vertical
            )
            
            Spacer()
            
        }
        .padding()
        
    }
}

struct ContactPositionAddView_Previews: PreviewProvider {
    static var previews: some View {
        ContactPositionAddView(isPresentingMedicationAdd: .constant(true), nameToAdd: "")
    }
}

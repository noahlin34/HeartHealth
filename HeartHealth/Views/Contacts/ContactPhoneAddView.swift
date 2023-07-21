//
//  ContactPhoneAddView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-20.
//

import SwiftUI

struct ContactPhoneAddView: View {
    
    
    @Binding var isPresentingMedicationAdd: Bool
    @State var phoneNumberField = ""
    @State var extensionField = ""
    
    
    let nameToAdd: String
    let positionToAdd: String
    
    var body: some View {
        VStack {
            Text("What is the contact's phone number?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.vertical)
            
            
            HStack {
                TextField("Phone Number", text: $phoneNumberField)
                    .onReceive(phoneNumberField.publisher.collect()) {
                        phoneNumberField = String($0.prefix(10))
                    }
                    .padding(.leading)
                    .keyboardType(.numberPad)
                TextField("Extension", text: $extensionField)
                    .onReceive(extensionField.publisher.collect()) {
                        extensionField = String($0.prefix(4))
                    }
                    .keyboardType(.numberPad)
            }
            .padding(.vertical
            )
            
            
            NavigationLink(destination: ContactEmailAddView(isPresentingMedicationAdd: $isPresentingMedicationAdd, nameToAdd: nameToAdd, positionToAdd: positionToAdd, phoneToAdd: phoneNumberField, phoneExtensionToAdd: Int64(extensionField) ?? -1)) {
                Text("Next")
                    .frame(width: 300)
                
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
            Spacer()
        }
        .padding()
        
    }
    
    
    
    
    
}

struct ContactPhoneAddView_Previews: PreviewProvider {
    static var previews: some View {
        ContactPhoneAddView(isPresentingMedicationAdd: .constant(true), nameToAdd: "", positionToAdd: "")
    }
}

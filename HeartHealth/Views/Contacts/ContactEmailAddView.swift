//
//  ContactEmailAddView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-20.
//

import SwiftUI

struct ContactEmailAddView: View {
    
    @Binding var isPresentingMedicationAdd: Bool
    @State var emailField = ""
    
    let nameToAdd: String
    let positionToAdd: String
    let phoneToAdd: String
    let phoneExtensionToAdd: Int64
    
    var body: some View {
        VStack {
            Text("What's the contact's email address?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.vertical)
            
            TextField("Input an email address", text: $emailField)
                .onReceive(emailField.publisher.collect()) {
                    emailField = String($0.prefix(80))
                }
                .keyboardType(.emailAddress)
                .padding()
            
            NavigationLink(destination: ContactNotesAddView(isPresentingMedicationAddView: $isPresentingMedicationAdd, nameToAdd: nameToAdd, positionToAdd: positionToAdd, phoneToAdd: phoneToAdd, phoneExtensionToAdd: phoneExtensionToAdd, email: emailField)) {
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

struct ContactEmailAddView_Previews: PreviewProvider {
    static var previews: some View {
        ContactEmailAddView(isPresentingMedicationAdd: .constant(true), nameToAdd: "", positionToAdd: "", phoneToAdd: "", phoneExtensionToAdd: 4)
    }
}

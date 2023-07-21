//
//  ContactNameAddView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-19.
//

import SwiftUI

struct ContactNameAddView: View {
    
    
    @Binding var isPresentingMedicationAdd: Bool
    
    @State var nameField = ""
    
    
    var body: some View {

        NavigationStack {
            VStack {
                Text("What is the name of the health care contact?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                TextField("Input a name", text: $nameField)
                    .onReceive(nameField.publisher.collect()) {
                        nameField = String($0.prefix(30))
                    }
                    .padding()
                
                NavigationLink(destination: ContactPositionAddView(isPresentingMedicationAdd: $isPresentingMedicationAdd, nameToAdd: nameField)) {
                    Text("Next")
                        .frame(width: 300)
                    
                }
                .buttonStyle(.borderedProminent)
                .padding(.top)
                
                Spacer()
                
                
                
                
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresentingMedicationAdd = false
                    }
                }
            }
        }

    }
}

struct ContactNameAddView_Previews: PreviewProvider {
    static var previews: some View {
        ContactNameAddView(isPresentingMedicationAdd: .constant(true))
    }
}

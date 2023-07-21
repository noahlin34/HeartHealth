//
//  MedicationAddView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-15.
//

import SwiftUI

struct MedicationAddView: View {
    
    @State var medicationName = ""
    @Binding var isPresentingAddMedication: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("What is the name of your medication?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                TextField("Enter a name", text: $medicationName)
                    .onReceive(medicationName.publisher.collect()) {
                        self.medicationName = String($0.prefix(20))
                    }
                    .padding(30)
                NavigationLink(destination: MedicationDosageView(isPresentingAddMedication: $isPresentingAddMedication, name: $medicationName.wrappedValue)) {
                   
                    Text("Next")
                        .frame(width: 300)
                        
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle)
                .padding(.vertical)
                
                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                      isPresentingAddMedication = false
                    }
                }
            }
            
        }
    }
}

struct MedicationAddView_Previews: PreviewProvider {
    static var previews: some View {
        MedicationAddView(isPresentingAddMedication: .constant(true))
    }
}

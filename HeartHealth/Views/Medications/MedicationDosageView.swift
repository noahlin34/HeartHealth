//
//  MedicationDosageView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-15.
//

import SwiftUI

struct MedicationDosageView: View {
    @Binding var isPresentingAddMedication: Bool

    
    @State var dosage = 0.0
    var name: String
    let dosageUnits = ["mg", "g", "mcg", "mL", "%"]
   @State var dosageUnit = "mg"
    
    
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("What is the dosage of your medication?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack {
                    TextField("Input a dosage amount", value: self.$dosage, format: .number)
                        .padding(.leading, 50)
                        .keyboardType(.decimalPad)
                    Picker("Select a Dosage Unit", selection: $dosageUnit) {
                        ForEach(dosageUnits, id: \.self) {
                            unit in
                            Text("\(unit)")
                        }
                    }
                    .pickerStyle(.inline)
                    .padding()
                }
                
                NavigationLink(destination: MedicationFrequencyView(isPresentingAddMedication: $isPresentingAddMedication, name: name, dosage: dosage, dosageUnit: dosageUnit)) {
                        Text("Next")
                        .frame(width: 300)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle)
                
                
                Spacer()
            }
            .padding()
        }
    }
}

struct MedicationDosageView_Previews: PreviewProvider {
    static var previews: some View {
        MedicationDosageView(isPresentingAddMedication: .constant(true), name: "Aspirin")
    }
}

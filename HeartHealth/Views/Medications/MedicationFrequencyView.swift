//
//  MedicationFrequencyView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-16.
//

import SwiftUI

struct MedicationFrequencyView: View {
    @Binding var isPresentingAddMedication: Bool
    
    var name: String
    var dosage: Double
    var dosageUnit: String

    @State var dosageFrequency = "Every Day"
    @State var timesPerDay: Int32 = 0
    
    @State var customDosageFrequency = "E.g: Every other day, twice per day"
    
    let frequencies = ["Every Day", "As Needed", "Custom"]
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("How often do you take this medication?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Picker("Select a Frequency", selection: $dosageFrequency) {
                    ForEach(frequencies, id: \.self) {
                        frequencies in
                        Text("\(frequencies)")
                    }
                }
                .pickerStyle(.inline)
                
                if(dosageFrequency == "Every Day") {
                    VStack {
                        HStack {
                            TextField("How many times per day?", value: $timesPerDay, format: .number)
                                .disabled(timesPerDay > 100)
                                .padding()
                                .keyboardType(.numberPad)
                                .frame(width: 70)
                                .textFieldStyle(.roundedBorder)
                            Text("Times per day")
                        }
                        NavigationLink(destination: MedicationPurposeView(isPresentingAddMedication: $isPresentingAddMedication, name: name, dosage: dosage, dosageUnit: dosageUnit, dosageFrequency: "Every Day", timesPerDay: timesPerDay)) {
                         Text("Next")
                                .frame(width: 300)
                        }
                        .buttonBorderShape(.roundedRectangle)
                        .buttonStyle(.borderedProminent)
                    }
                    
                }
                
                if(dosageFrequency == "Custom") {
                    VStack {
                        TextEditor(text: $customDosageFrequency)
                            .padding()
                        NavigationLink(destination: MedicationPurposeView(isPresentingAddMedication: $isPresentingAddMedication, name: name, dosage: dosage, dosageUnit: dosageUnit, dosageFrequency: customDosageFrequency, timesPerDay: -1)) {
                            Text("Next")
                                .frame(width: 300)

                        }
                        .buttonBorderShape(.roundedRectangle)
                        .buttonStyle(.borderedProminent)
                        Spacer()
                    }
                }
              
            
                if(dosageFrequency == "As Needed") {
                    NavigationLink(destination: MedicationPurposeView(isPresentingAddMedication: $isPresentingAddMedication, name: name, dosage: dosage, dosageUnit: dosageUnit, dosageFrequency: "As Needed", timesPerDay: -1)) {
                        Text("Next")
                            .frame(width: 300)

                    }
                    .buttonBorderShape(.roundedRectangle)
                    .buttonStyle(.borderedProminent)
                }
                
                
                
                Spacer()
            }
            .padding()
        }
    }
}

struct MedicationFrequencyView_Previews: PreviewProvider {
    static var previews: some View {
        MedicationFrequencyView(isPresentingAddMedication: .constant(true), name: "Aspirin", dosage: 2, dosageUnit: "mg")
    }
}

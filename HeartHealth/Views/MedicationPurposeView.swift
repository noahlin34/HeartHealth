//
//  MedicationPurposeView.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-16.
//

import SwiftUI

struct MedicationPurposeView: View {
    @Binding var isPresentingAddMedication: Bool

    var name: String
    var dosage: Double
    var dosageUnit: String

    var dosageFrequency: String
    var timesPerDay: Int32
    
    @State var purpose = ""

    var body: some View {
        NavigationStack {
            VStack {
                Text("What is the purpose of this medication?")
                    .padding()
                    .font(.largeTitle)
                    .fontWeight(.bold)
                TextField("Why do you take this medication?", text: $purpose)
                    .onReceive(purpose.publisher.collect()) {
                        self.purpose = String($0.prefix(20))
                    }
                    .padding()
                
                
                NavigationLink(destination: MedicationNotesView(isPresentingAddMedication: $isPresentingAddMedication, name: name, dosage: dosage, dosageUnit: dosageUnit, dosageFrequency: dosageFrequency, timesPerDay: timesPerDay, purpose: purpose)) {
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

struct MedicationPurposeView_Previews: PreviewProvider {
    static var previews: some View {
        MedicationPurposeView(isPresentingAddMedication: .constant(true), name: "Aspirin", dosage: 2, dosageUnit: "mg", dosageFrequency: "Every Day", timesPerDay: 2)
    }
}
